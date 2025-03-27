FROM debian:stable-slim
#FROM alpine:latest

# ENVIRONMENT
ENV CRON_SCHEDULE="0 3 1 * *"
ENV SCRIPT_FLAGS="-d -w -c -f"
ENV TZ="Canada/Atlantic"

# BASICS
#RUN apk update
##RUN apk upgrade
#RUN apk add --no-cache ca-certificates coreutils gnutls-utils curl bash tzdata wget git

# TIMEZONE
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get -qq -y install git wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/\* /tmp/\* /var/tmp/*

WORKDIR /app
RUN git clone https://github.com/jojo2357/kiwix-zim-updater.git ./data
RUN chmod +x /app/data/kiwix-zim-updater.sh
# ADD SCRIPT
#RUN wget https://raw.githubusercontent.com/jojo2357/kiwix-zim-updater/main/kiwix-zim-updater.sh -O /app/kiwix-zim-updater.sh

#RUN chmod +x /app/kiwix-zim-updater.sh

# VOLUMES
#VOLUME /zim

# CRON
ADD crontab /
#RUN crontab crontab

# CMD
CMD ["ping", "8.8.8.8"]
