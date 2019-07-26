FROM debian:buster-slim
VOLUME /backup
WORKDIR /backup

# install required packages
RUN apt-get update \
  && apt-get -y install gnupg cron \
  && apt-key adv \
    --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 \
  && echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" \
    | tee /etc/apt/sources.list.d/mongodb-org-4.0.list \
  && apt-get update && apt-get install -y mongodb-org-tools

# init script
COPY init.sh /root/init_container
RUN chmod +x /root/init_container

# setup backup scripts
COPY backup.sh /usr/local/bin/backup
COPY backup_hourly.sh /usr/local/bin/backup_hourly
COPY backup_daily.sh /usr/local/bin/backup_daily
COPY backup_weekly.sh /usr/local/bin/backup_weekly
COPY backup_monthly.sh /usr/local/bin/backup_monthly
RUN chmod +x /usr/local/bin/backup \
  /usr/local/bin/backup_hourly \
  /usr/local/bin/backup_daily \
  /usr/local/bin/backup_weekly \
  /usr/local/bin/backup_monthly

# setup the backup cron job
COPY backup_cron /etc/cron.d/backup_cron
RUN chmod 0644 /etc/cron.d/backup_cron
RUN crontab /etc/cron.d/backup_cron

# command to run at start
CMD /root/init_container
