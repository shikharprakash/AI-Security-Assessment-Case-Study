#!/usr/bin/env bash
# Publish this portfolio repository to a personal GitHub account.
# Usage: ./push_to_github.sh [repo-name]
#
# Needs a GitHub personal access token:
#   - classic token with the "repo" scope, or
#   - fine-grained token with "Administration: write" + "Contents: write".
#
# Adapted from ISB_Capstone/push_to_github.sh with three additions:
#   1. a location guard, so it can never act on the wrong repository
#   2. a confidentiality gate that must pass before the first commit
#   3. public visibility requires typing PUBLIC in full
#
# MIT licensed.
set -euo pipefail

GIT_EMAIL="shikharprakash07@gmail.com"
DEFAULT_REPO="ai-security-assessment-case-study"
DESCRIPTION="Product case study: designing, validating and shipping a questionnaire-driven AI security assessment. Personal work; no employer-proprietary content."
API="https://api.github.com"

cd "$(dirname "$0")"
HERE="$PWD"

for cmd in git curl python3; do
  command -v "$cmd" >/dev/null || { echo "Error: '$cmd' is not installed." >&2; exit 1; }
done

# ---- location guard -------------------------------------------------------
# The push itself is harmless; `git remote set-url origin` below is not. Run by
# accident inside a work repository, it would repoint that repo's origin at a
# personal account and push it. These three checks make that impossible.
[[ -f "$HERE/.portfolio-root" ]] || {
  echo "Error: .portfolio-root marker not found in $HERE." >&2
  echo "This script only ever runs in its own portfolio directory." >&2; exit 1; }
[[ "$HERE" != "$HOME" ]] || { echo "Error: refusing to run in \$HOME." >&2; exit 1; }
if git rev-parse --show-toplevel >/dev/null 2>&1; then
  TOP="$(git rev-parse --show-toplevel)"
  [[ "$TOP" == "$HERE" ]] || {
    echo "Error: $HERE sits inside another git repository ($TOP)." >&2
    echo "Refusing to act on a repository that is not this one." >&2; exit 1; }
fi

# ---- confidentiality gate -------------------------------------------------
if [[ -x tools/prepublish-check.sh ]]; then
  echo "Running pre-publication confidentiality review…"
  if ! bash tools/prepublish-check.sh; then
    echo >&2
    echo "Confidentiality review FAILED. Nothing has been committed or pushed." >&2
    echo "Resolve every FAIL and run again." >&2
    exit 1
  fi
  echo
  read -r -p "Review complete. Have you read every document end to end? [y/N]: " READIT
  case "${READIT:-N}" in [yY]*) ;; *) echo "Stopping. Read them first."; exit 1 ;; esac
else
  echo "Warning: tools/prepublish-check.sh not found — publishing unchecked." >&2
  read -r -p "Continue anyway? [y/N]: " ANYWAY
  case "${ANYWAY:-N}" in [yY]*) ;; *) exit 1 ;; esac
fi

# ---- inputs ---------------------------------------------------------------
REPO_NAME="${1:-}"
if [[ -z "$REPO_NAME" ]]; then
  read -r -p "Repository name [$DEFAULT_REPO]: " REPO_NAME
  REPO_NAME="${REPO_NAME:-$DEFAULT_REPO}"
fi

echo
echo "Visibility. A public repository's history is permanent: a file removed later"
echo "remains reachable by commit SHA, and forks and caches persist."
read -r -p "Type PUBLIC in full to publish publicly, or press Enter for private: " VIS
if [[ "$VIS" == "PUBLIC" ]]; then
  PRIVATE=false; echo "  -> PUBLIC"
else
  PRIVATE=true;  echo "  -> private"
fi

COMMIT_MSG="${COMMIT_MSG:-Add AI security assessment product case study}"

read -r -s -p "GitHub personal access token: " GH_TOKEN; echo
[[ -n "$GH_TOKEN" ]] || { echo "Error: no token entered." >&2; exit 1; }

json_field() { python3 -I -c "import sys,json; print(json.load(sys.stdin).get('$1',''))"; }

RESP_FILE=$(mktemp)
trap 'unset GH_TOKEN; rm -f "$RESP_FILE"' EXIT

gh_api() {  # gh_api METHOD PATH [JSON]
  HTTP_STATUS=$(curl -sS -o "$RESP_FILE" -w '%{http_code}' -X "$1" "$API$2" \
        -H "Authorization: Bearer $GH_TOKEN" \
        -H "Accept: application/vnd.github+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        ${3:+-d "$3"})
}

# ---- who am I -------------------------------------------------------------
gh_api GET /user
[[ "$HTTP_STATUS" == "200" ]] || {
  echo "Error: token rejected by GitHub (HTTP $HTTP_STATUS)." >&2; exit 1; }
GH_USER=$(json_field login < "$RESP_FILE")
GH_NAME=$(json_field name  < "$RESP_FILE")
echo "Authenticated as: $GH_USER"

# ---- local repository -----------------------------------------------------
if [[ ! -d .git ]]; then
  git init -q
  git checkout -q -b main
fi
git config user.email "$GIT_EMAIL"
git config user.name  "${GH_NAME:-$GH_USER}"

# .gitignore is committed deliberately and is never generated here — the
# exclusion list is part of the repository, not an artefact of this script.
[[ -f .gitignore ]] || { echo "Error: .gitignore is missing." >&2; exit 1; }

git add -A
if git diff --cached --quiet; then
  echo "No new changes to commit."
else
  git commit -q -m "$COMMIT_MSG"
  echo "Committed: $COMMIT_MSG"
fi
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# ---- create the repository -------------------------------------------------
BODY=$(python3 -I -c 'import json,sys; print(json.dumps({"name": sys.argv[1],
  "private": sys.argv[2] == "true", "description": sys.argv[3]}))' \
  "$REPO_NAME" "$PRIVATE" "$DESCRIPTION")
gh_api POST /user/repos "$BODY"
case "$HTTP_STATUS" in
  201) echo "Created $GH_USER/$REPO_NAME (private=$PRIVATE)." ;;
  422) echo "Repository $GH_USER/$REPO_NAME already exists; pushing to it." ;;
  *)   echo "Error creating repository (HTTP $HTTP_STATUS):" >&2
       json_field message < "$RESP_FILE" >&2; exit 1 ;;
esac

# ---- push (token as a one-off header, never stored) --------------------------
REMOTE_URL="https://github.com/$GH_USER/$REPO_NAME.git"
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

AUTH=$(printf 'x-access-token:%s' "$GH_TOKEN" | base64 | tr -d '\n')
git -c credential.helper= -c http.extraHeader="Authorization: Basic $AUTH" \
    push -u origin "$BRANCH"
unset AUTH

echo
echo "Done: https://github.com/$GH_USER/$REPO_NAME"
[[ "$PRIVATE" == "true" ]] && echo "It is private. Review it on github.com, then change visibility in Settings."
