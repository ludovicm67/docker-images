#!/bin/sh

# env:
#   - MONGO_URI:              mongo URI to connect to the database

# make sure env are set up correctly
. /usr/local/env.sh

set -aux

# dump using date format
DUMP_NAME=$(date "+%Y-%m-%d-%H-%M")
mongodump \
  --uri "$MONGO_URI" \
  --gzip --archive > "/backup/dump_$DUMP_NAME.gz"

echo "Backup: /backup/dump_$DUMP_NAME.gz"

exit 0
