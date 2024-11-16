#!/usr/bin/env bash

# Variables
DIARY_DIR="/c/Users/Ha Dang/thaiha-hub"  # Path to my local GitHub repo
DIARY_FILE="$DIARY_DIR/my_diary.md"  # Single file for all diary entries
DATE=$(date +"%d-%m-%Y")  # Today's date

# Create the diary directory
mkdir -p "$DIARY_DIR"

# Create the diary file if it doesn't exist
if [ ! -f "$DIARY_FILE" ]; then
	echo "# My Daily Diary" > "$DIARY_FILE"
fi

# Check if today's date already exists
if grep -q "## $DATE" "$DIARY_FILE"; then
	# Append to today's section
	echo "Write your diary entry. Press Ctrl+D when done:"
	echo "" >> "$DIARY_FILE"  # Add a blank line
	cat >> "$DIARY_FILE"      # Append the user's input directly to today's section
else
	# Add today's date as a heading
	echo "## $DATE" >> "$DIARY_FILE"
	# Prompt the user to write diary entry
	echo "Write your diary entry. Press Ctrl+D when done:"
	cat >> "$DIARY_FILE"  # Append the user's input directly to the diary file
	# Add a separator after the entry
	echo "---" >> "$DIARY_FILE"
fi

# Navigate to the diary directory
cd "$DIARY_DIR" || exit

# Add, commit, and push to GitHub
git add "$DIARY_FILE"
git commit -m "Diary update for $DATE"
git push origin main

echo "Diary entry added and pushed to GitHub!"

