FROM alpine:latest

# ENVIRONMENT
ENV CRON_SCHEDULE="0 3 1 * *"
ENV SCRIPT_FLAGS="-d -w -c -f"
ENV TZ="Canada/Atlantic"

# BASICS
RUN apk update
RUN apk upgrade
RUN apk add --no-cache ca-certificates coreutils gnutls-utils curl bash tzdata wget git

# TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir /app

# ADD SCRIPT
RUN wget https://raw.githubusercontent.com/jojo2357/kiwix-zim-updater/main/kiwix-zim-updater.sh -O /app/kiwix-zim-updater.sh
RUN chmod +x /app/kiwix-zim-updater.sh

# VOLUMES
#VOLUME /zim

# CRON
ADD crontab /
RUN crontab crontab

# CMD
CMD ["crond", "-f"]
