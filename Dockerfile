FROM alpine:latest
CMD ["ash"]
RUN apk add --no-cache python3 py3-pip
COPY Ratio.py /app
WORKDIR /app
RUN pip install -r requirements.txt --break-system-packages
RUN pip install watchdog --break-system-packages
RUN adduser -u 1000 -s /bin/ash -D ratiomaster
RUN chown -R ratiomaster:ratiomaster /app 
USER ratiomaster
CMD ["/usr/bin/python","/app/entrypoint.py"]