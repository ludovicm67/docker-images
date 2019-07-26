#!/bin/sh

echo "Init container..."
mkdir -p /backup/hourly /backup/daily /backup/weekly /backup/monthly

printenv | sed 's/^\(.*\)$/export \1/g' > /usr/local/env.sh
echo "Env: OK"
cron && echo "Cron: OK" || echo "Cron: KO"
exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"

exit 0
