!/bin/bash

# Configuration
BACKUP_SOURCE="/root/Documents"  # Change this to the directory you want to back up
BACKUP_DEST="/backup"                  # Local backup storage location
REMOTE_USER="your_username"

# Create timestamped backup filename
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

# Ensure backup destination exists
mkdir -p "$BACKUP_DEST"

# Create a compressed backup
tar -czf "$BACKUP_DEST/$BACKUP_FILE" "$BACKUP_SOURCE"

# Verify the backup integrity
if tar -tzf "$BACKUP_DEST/$BACKUP_FILE" >/dev/null; then
    echo "Backup created successfully: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi
