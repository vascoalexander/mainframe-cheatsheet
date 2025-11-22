#!/bin/sh
# sync-cobol.sh - Sync COBOL files from Git to PDS

REPO_DIR="/u/userid/git/myrepo"
PDS="MYHLQ.COBOL.SOURCE"

cd $REPO_DIR

# Git pull
git pull origin main

# Sync nur COBOL-Dateien
for file in src/cobol/*.cbl; do
  if [ -f "$file" ]; then
    member=$(basename "$file" .cbl | tr '[:lower:]' '[:upper:]')
    echo "Copying $file to $PDS($member)"

    # ASCII to EBCDIC und copy zu PDS
    iconv -f ISO8859-1 -t IBM-1047 "$file" | \
    cp /dev/stdin "//'$PDS($member)'"
  fi
done

echo "Sync completed"