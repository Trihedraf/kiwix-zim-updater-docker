# Kiwix ZIM Updater (Docker)
This container uses [this script by jojo2357](https://github.com/jojo2357/kiwix-zim-updater) to check whether ZIM files are up to date and download new copies. By default it performs this task once a month, however this can be customized using environment variables. The script flags can also be customized via environment variables to tweak the operation.

## Example Docker Compose

```yaml
  kiwix-updater:
    image: ghcr.io/colino17/kiwix-zim-updater-docker:latest
    container_name: kiwix-updater
    restart: always
    networks:
      - primary
    environment:
      - CRON_SCHEDULE="0 3 1 * *"
      - ENV SCRIPT_FLAGS="-d -w -c -f"
    volumes:
      - /path/to/zim/files:/zim
```
