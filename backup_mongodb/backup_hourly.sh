#!/bin/sh

# env:
#   - BACKUP_RETENTION_HOURS:  number of days that hours backup will be kept
#   - MONGO_URI:               mongo URI to connect to the database

# make sure env are set up correctly
. /usr/local/env.sh

# do not backup if no retention specified
if [ -z "$BACKUP_RETENTION_HOURS" ] || [ "$BACKUP_RETENTION_HOURS" -le 0 ]; then
  exit 0
fi

set -aux

# dump using date format
DUMP_NAME=$(date "+%Y-%m-%d-%H-%M")
mongodump \
  --uri "$MONGO_URI" \
  --gzip --archive > "/backup/hourly/dump_$DUMP_NAME.gz"

echo "Backup (hourly): /backup/hourly/dump_$DUMP_NAME.gz"

# remove old backups
find /backup/hourly -type f -mtime "+$BACKUP_RETENTION_HOURS" \
  -name '*.gz' \
  -execdir rm -- '{}' \;

exit 0
