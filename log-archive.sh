#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

LOG_DIR="$1"
ARCHIVE_DIR="archive_logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="logs_archive_$TIMESTAMP.tar.gz"
LOG_FILE="archive_log.txt"


if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir -p "$ARCHIVE_DIR"
    echo "Created directory: $ARCHIVE_DIR"
fi
tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" -C "$LOG_DIR" .

if [ $? -eq 0 ]; then
    echo "Logs archived successfully: $ARCHIVE_FILE"
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived logs to $ARCHIVE_DIR/$ARCHIVE_FILE" >> "$LOG_FILE"

else
    echo "Error compressing logs."
    exit 1
fi

