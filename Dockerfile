FROM alpine:latest

# ENVIRONMENT
ENV SCRIPT_FLAGS -d -w -c -f
ENV TZ America/Los_Angeles

# BASICS
RUN apk add --no-cache bash coreutils grep tzdata wget

# TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ADD SCRIPT
RUN git clone https://github.com/jojo2357/kiwix-zim-updater /app
RUN chmod +x /app/kiwix-zim-updater.sh

# VOLUMES
VOLUME /zim

# CRON
ADD crontab /
RUN crontab crontab

# CMD
CMD ["crond", "-f"]
