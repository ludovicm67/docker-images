#!/bin/sh

# env:
#   - BACKUP_RETENTION_WEEKS:   number of weeks backup will be kept
#   - MONGO_URI:                mongo URI to connect to the database

# make sure env are set up correctly
. /usr/local/env.sh

# do not backup if no retention specified
if [ -z "$BACKUP_RETENTION_WEEKS" ] || [ "$BACKUP_RETENTION_WEEKS" -le 0 ]; then
  exit 0
fi

set -aux

# dump using date format
DUMP_NAME=$(date "+%Y-%m-%d-%H-%M")
mongodump \
  --uri "$MONGO_URI" \
  --gzip --archive > "/backup/weekly/dump_$DUMP_NAME.gz"

echo "Backup (weekly): /backup/weekly/dump_$DUMP_NAME.gz"

# remove old backups
NB_DAYS=$((BACKUP_RETENTION_WEEKS * 7))
find /backup/weekly -type f -mtime "+$NB_DAYS" \
  -name '*.gz' \
  -execdir rm -- '{}' \;

exit 0
