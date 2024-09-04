#!/usr/bin/env bash
#
# Link dotfiles.
cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

# Check if file is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 file_with_pairs.txt"
    exit 1
fi

# Get the home directory of the current user
HOME_DIR="$HOME"

# Read the file line by line
while IFS=" " read -r file_path symlink_path; do

    # Skip blank lines
    if [ -z "$file_path" ]; then
        continue
    fi

    # Check if both file and symlink paths are provided
    if [[ -z "$file_path" || -z "$symlink_path" ]]; then
        echo "Invalid line, skipping: $file_path $symlink_path"
        continue
    fi
    
    # Get the absolute paths
    abs_file_path="$DOTFILES_ROOT/$file_path"
    # Prepend home directory to symlink paths
    abs_symlink_path="$HOME_DIR/$symlink_path"

    # Check if the source file exists
    if [ ! -e "$abs_file_path" ]; then
        echo "Source file does not exist: $abs_file_path, skipping."
        continue
    fi

    # Create the directory for the symlink if it doesn't exist
    symlink_dir=$(dirname "$abs_symlink_path")
    if [ ! -d "$symlink_dir" ]; then
        echo "Creating directory: $symlink_dir"
        mkdir -p "$symlink_dir"
    fi

    # Create the symlink
    ln -sf "$abs_file_path" "$abs_symlink_path"
    echo "Symlink created: $abs_symlink_path -> $abs_file_path"

done < "$1"
