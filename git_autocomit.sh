#!/bin/bash

# Navigate to your repository
cd ~/Documents/dev/backups/ubuntuConfig/. || exit

# Sync file
./sync.sh

# Check for changes
if git diff --exit-code --quiet && git diff --cached --exit-code --quiet; then
  echo "No changes to commit."
  exit
fi

# Configure Git user
git config user.email "nino.mauuary@gmail.com"
git config user.name "nino.mauu"

# Stage and commit changes
git add .
git commit -m "Automated commit on $(date)"

# Push changes
git push origin homeDekstop
