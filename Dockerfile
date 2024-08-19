FROM lscr.io/linuxserver/transmission:latest
COPY resources/ /app

# Install packages 
RUN apk add --no-cache py3-pip \
	&& pip install --no-cache-dir -r /app/requirements.txt --break-system-packages

# Install OpenRC 
RUN apk --no-cache add openrc \ 
	&& apk update \
	&& mkdir -p touch /run/openrc/ \
	&& touch /run/openrc/softlevel

# Setup files
RUN mv /app/inotifyd /etc/init.d/inotifyd \
	&& mv /app/conf_inotifyd /etc/conf.d/inotifyd \
	&& chmod +x /etc/init.d/inotifyd \
	&& chmod +x /app/script.sh \
	&& mv /app/init /init \ 
	&& chmod +x /init

RUN rc-update add inotifyd sysinit