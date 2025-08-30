# Kiwix ZIM Updater (Docker)
This container uses [this script by jojo2357](https://github.com/jojo2357/kiwix-zim-updater) to check whether ZIM files are up to date and download new copies.

It performs the check on the seventh day of every month as long as the container is running.

The container will output the run logs to docker logs and logs/$(date_time).log in your zim folder every time the cron task executes.

The script flags can be customized via environment variables to tweak the operation.
