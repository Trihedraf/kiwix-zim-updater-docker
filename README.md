# Kiwix ZIM Updater (Docker)
This container uses [this script by jojo2357](https://github.com/jojo2357/kiwix-zim-updater) to check whether ZIM files are up to date and download new copies. 

It performs the check on the first day of every month as long as the container is running. 

## Example Docker Compose

This compose snippet can be used to deploy the container.

```yaml
  kiwix-updater:
    image: ghcr.io/colino17/kiwix-zim-updater-docker:latest
    container_name: kiwix-updater
    restart: always
    environment:
      - TZ=Canada/Atlantic
    volumes:
      - /path/to/zim/files:/zim
```
