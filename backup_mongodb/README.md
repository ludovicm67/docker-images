`backup_mongo`
==============

> Image to backup a mongoDB database.

## Environment variables

  - `BACKUP_RETENTION_DAYS`: number of days backup will be kept (default: 7)
  - `BACKUP_RETENTION_HOURS`: number of days of hourly backups that need to be kept (disabled)
  - `BACKUP_RETENTION_WEEKS`: number of days of hourly backups that need to be kept (disabled)
  - `BACKUP_RETENTION_MONTHS`: number of months backup will be kept (disabled)
  - `MONGO_URI`: mongo URI to connect to the database

By default only daily backup will be made and will be kept for 7 days. It's required to specify a `MONGO_URI` to make the backup script work. If you want to enable hourly and/or monthly backups, just specify a number of months or days you want to keep.

## Volumes

  - `/backup`: store backups in a persistant volume
