#!/bin/ash

event="$1"
directory="$2"
file="$3"

# run some command based on an event
case "$event" in
  y) python3 /app/ratio.py "$directory/$file" &> /proc/1/fd/1 ;;
  *) echo "This will never happen as we only listen for n.";;
esac