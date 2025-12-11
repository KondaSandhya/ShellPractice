#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}  # Default to 14 days if not provided


if [ $# -le 2 ] 
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

TIME_STAMP=$(date +"%Y%m%d_%H%M%S")
Dest="$DEST_DIR/backup_$TIME_STAMP"
mkdir -p "$Dest"

#creating temp file to store list of files to be backed up
touch temp_file.txt

find "$SOURCE_DIR" -type f -mtime +$DAYS > temp_file.txt
tar -czf "$Dest.tar.gz" -T "temp_file.txt"
rm -f temp_file.txt
if [ $? -eq 0 ]; then
    echo "Backup completed successfully. Backup stored at: $DEST_DIR directory."
    rm -rf $(find "$SOURCE_DIR" -type f -mtime +$DAYS)
    echo "Old files deleted from source directory."
else
    echo "Backup failed."
    exit 1
fi


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



