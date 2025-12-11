#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}  # Default to 14 days if not provided
ZIP_FILE="backup"

if [ $# -ne 2 ] 
then
    echo "Usage: $0 <SOURCE_DIR> <DEST_DIR> <DAYS> ( optional)" 
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ] 
then
    echo "Source directory $SOURCE_DIR does not exist."
    exit 1
fi

if [ ! -d "$DEST_DIR" ] 
then
    echo "Destination directory $DEST_DIR does not exist."
    exit 1
fi

FILES=find "$SOURCE_DIR" -type f -mtime +$DAYS 

# if [ -z "$FILES" ]
# then 
#     echo "NO files older than $DAYS days found in $SOURCE_DIR."
#     exit 0
# else
#     TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
#     echo "Creating  backup directory: $DEST_DIR/$ZIP_FILE-$TIMESTAMP"
#     mkdir -p "$DEST_DIR/$ZIP_FILE-$TIMESTAMP"
#     tar -czf "$DEST_DIR/$ZIP_FILE-$TIMESTAMP.tar.gz" $FILES
#     echo "Backup completed successfully. Backup stored at: $DEST_DIR/$ZIP_FILE-$TIMESTAMP.tar.gz"
    
# fi

while read -f file; do
    echo "Backing up file: $file"
    tar -czf "$DEST_DIR/$ZIP_FILE-$(date +%Y%m%d_%H%M%S).tar.gz" "$file"
done <<< "$FILES"


