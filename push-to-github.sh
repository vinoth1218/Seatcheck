#!/usr/bin/env bash
# Pushes Seatcheck to GitHub. Run it AFTER you have created the empty repo.
# Usage:  bash push-to-github.sh YOUR_GITHUB_USERNAME
set -e
USER="${1:?Pass your GitHub username: bash push-to-github.sh YOUR_USERNAME}"
cd "$(dirname "$0")"
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$USER/seatcheck.git"
echo "Pushing to https://github.com/$USER/seatcheck ..."
echo "A browser or a prompt will ask you to sign in to GitHub. That part is yours."
git push -u origin main
echo
echo "Pushed. Now turn on Pages:"
echo "  https://github.com/$USER/seatcheck/settings/pages"
echo "  Source: Deploy from a branch -> main -> / (root) -> Save"
echo
echo "Your site will be live in about two minutes at:"
echo "  https://$USER.github.io/seatcheck/"
