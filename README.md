# Docker Transmission with Ratio.py

This project creates a Docker image based on the official [Transmission](https://docs.linuxserver.io/images/docker-transmission/) image, integrating a Python script named [Ratio.py](https://github.com/MisterDaneel/Ratio.py) to automatically increase the download ratio for each torrent downloaded by Transmission.

# Usage
Run the Docker Container

Use the following command to run the Docker container :

```
docker run -d \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e TRANSMISSION_WEB_HOME= `#optional` \
  -e USER= `#optional` \
  -e PASS= `#optional` \
  -e WHITELIST= `#optional` \
  -e PEERPORT= `#optional` \
  -e HOST_WHITELIST= `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /path/to/data:/config \
  -v /path/to/downloads:/downloads \
  -v /path/to/watch/folder:/watch \
  --restart unless-stopped \
  ghcr.io/sdesous/transmission:latest
```

Make sure to replace /path/to/your/download/folder with the absolute path to your download folder.

# How does it works ?

A simple python script monitor the /config/torrents directory and then trigger for each torrent file added in it.

# Operation
Once the container is running and torrent downloads are added to Transmission, the Ratio.py script will automatically intervene to increase the download ratio for each torrent.

You can check if Ratio.py works correctly simply by checking the logs.

# Customization
You can customize the behavior of Ratio.py by modifying the source code or adjusting its parameters according to your needs.
