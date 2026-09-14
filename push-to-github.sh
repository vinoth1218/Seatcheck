#!/usr/bin/env bash
# Pushes Seatcheck to a GitHub repo, and REFUSES if that repo already has commits.
#
#   bash push-to-github.sh vinoth1218/seatcheck
#
# If the target already contains code (for example the Fastx bot fleet) this script
# stops without writing anything. Overwriting it is not worth a website.
set -euo pipefail

TARGET="${1:?Usage: bash push-to-github.sh OWNER/REPO   e.g. vinoth1218/seatcheck}"
case "$TARGET" in */*) ;; *) echo "Give it as OWNER/REPO, not just a name."; exit 1;; esac
URL="https://github.com/$TARGET.git"
cd "$(dirname "$0")"

echo "Target: $URL"
echo "Checking whether that repo already has commits."
echo "GitHub will ask you to sign in. That part is yours, not mine."
echo

REFS="$(git ls-remote --heads "$URL" 2>/dev/null || true)"

if [ -n "$REFS" ]; then
  echo "STOPPED. That repository already has branches:"
  echo "$REFS" | sed 's/^/    /'
  echo
  echo "Pushing Seatcheck here could overwrite what is already in it."
  echo "Nothing has been changed. Pick one:"
  echo "  1. Create a NEW empty repo and run this again with that name."
  echo "  2. If you really want Seatcheck inside this repo, say so and it goes in"
  echo "     a subfolder on its own branch, leaving the existing code untouched."
  exit 1
fi

echo "Repository is empty. Pushing."
git remote remove origin 2>/dev/null || true
git remote add origin "$URL"
git push -u origin main

OWNER="${TARGET%%/*}"; REPO="${TARGET##*/}"
echo
echo "Pushed. Now turn on Pages:"
echo "  https://github.com/$TARGET/settings/pages"
echo "  Source: Deploy from a branch  ->  main  ->  / (root)  ->  Save"
echo
echo "Live in about two minutes at:"
echo "  https://$OWNER.github.io/$REPO/"
