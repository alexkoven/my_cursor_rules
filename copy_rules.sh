#!/bin/bash

# Find git root directory
git_root=$(git rev-parse --show-toplevel 2>/dev/null)
if [ $? -ne 0 ]; then
    echo "Error: Not in a git repository!"
    exit 1
fi

# Set the cursor rules directory path
cursor_rules_dir="$git_root/.cursor/rules"
source_rules_dir="/home/falcon/Code/my_cursor_rules/rules"
parent_dir="/home/falcon/Code/my_cursor_rules"

# Safety check: Prevent execution from within the source rules directory, its parent, or subdirectories
current_dir=$(realpath "$(pwd)")
source_dir_real=$(realpath "$source_rules_dir")
parent_dir_real=$(realpath "$parent_dir")
if [[ "$current_dir" == "$source_dir_real"* ]] || [[ "$current_dir" == "$parent_dir_real" ]]; then
    echo "Error: This script cannot be executed from within the source rules directory, its parent directory, or its subdirectories!"
    exit 1
fi

# Create .cursor/rules directory if it doesn't exist
if [ ! -d "$cursor_rules_dir" ]; then
    echo "Creating directory: $cursor_rules_dir"
    mkdir -p "$cursor_rules_dir"
fi

# Check if source rules directory exists
if [ ! -d "$source_rules_dir" ]; then
    echo "Error: Source directory '$source_rules_dir' not found!"
    exit 1
fi

# Count files in rules directory
file_count=$(ls -1 "$source_rules_dir" | wc -l)

if [ "$file_count" -ne 4 ]; then
    echo "Warning: Expected 4 files in '$source_rules_dir', found $file_count files"
fi

# Copy all files from source rules directory to .cursor/rules directory
cp "$source_rules_dir"/* "$cursor_rules_dir/"

echo "Files copied successfully to $cursor_rules_dir" 
