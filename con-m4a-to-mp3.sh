#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is not installed. Please install ffmpeg before running this script."
    exit 1
fi

# Loop through all .m4a files in the current directory
for file in *.m4a; do
    # Check if the file exists and is a regular file
    if [[ -f "$file" ]]; then
        # Extract the filename without extension
        filename=$(basename "$file" .m4a)
        
        # Convert .m4a to .mp3 using ffmpeg
        ffmpeg -i "$file" -codec:a libmp3lame -q:a 2 "$filename.mp3"
        
        # Check if conversion was successful
        if [[ $? -eq 0 ]]; then
            echo "Converted $file to $filename.mp3"
        else
            echo "Error converting $file"
        fi
    fi
done
