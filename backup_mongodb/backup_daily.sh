#!/bin/sh

# env:
#   - BACKUP_RETENTION_DAYS:  number of days backup will be kept
#   - MONGO_URI:              mongo URI to connect to the database

# make sure env are set up correctly
. /usr/local/env.sh

# default value for retention days
if [ -z "$BACKUP_RETENTION_DAYS" ]; then
  BACKUP_RETENTION_DAYS=7
fi

set -aux

# dump using date format
DUMP_NAME=$(date "+%Y-%m-%d-%H-%M")
mongodump \
  --uri "$MONGO_URI" \
  --gzip --archive > "/backup/daily/dump_$DUMP_NAME.gz"

echo "Backup (daily): /backup/daily/dump_$DUMP_NAME.gz"

# remove old backups
find /backup/daily -type f -mtime "+$BACKUP_RETENTION_DAYS" \
  -name '*.gz' \
  -execdir rm -- '{}' \;

exit 0
