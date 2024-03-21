FROM lscr.io/linuxserver/transmission:latest
RUN apk add --no-cache py3-pip
COPY Ratio.py /app
RUN pip install --no-cache-dir -r /app/requirements.txt --break-system-packages
CMD ["python3", "/app/entrypoint.py", "&>", "/proc/self/fd/1"]