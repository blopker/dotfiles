#!/bin/bash

# Check if file is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 file_with_pairs.txt"
    exit 1
fi

# Get the home directory of the current user
HOME_DIR="$HOME"

# Read the file line by line
while IFS=" " read -r file_path symlink_path; do
    # Prepend home directory to file and symlink paths
    abs_symlink_path="$HOME_DIR/$symlink_path"

    # Skip blank lines
    if [ -z "$file_path" ]; then
        continue
    fi

    # Check if the symlink path exists and is a symlink
    if [ -L "$abs_symlink_path" ]; then
        echo "Deleting symlink: $abs_symlink_path"
        rm "$abs_symlink_path"
    else
        echo "No symlink found at: $abs_symlink_path, skipping."
    fi

done < "$1"
