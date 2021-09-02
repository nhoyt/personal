#!/usr/bin/env bash

# Sync the portfolio folder with the Git Sites/portfolio working copy
# Dependency: Mount 'Backup Disk' on pascal before running

SOURCE="$HOME/Sites/portfolio"
DESTINATION="$HOME/Sites/nicholashoyt"

if [ ! -d "$SOURCE" ]; then
    echo "Unable to find '$SOURCE' folder..."
    exit
fi

echo "Synchronizing '$SOURCE' files with '$DESTINATION'..."
echo

rsync -av --delete --delete-excluded --exclude=".git/" --exclude='archive/' --exclude='README.md' --exclude='.DS_Store' \
"$SOURCE" "$DESTINATION"
