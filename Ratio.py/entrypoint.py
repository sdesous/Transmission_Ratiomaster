from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from code.process_torrent import process_torrent
import random as rand
import os.path
import time

class MyHandler(FileSystemEventHandler):
    def on_created(self, event):
        time.sleep(1)
        tab = event.src_path.split('.')
        path = '.'.join(tab[:tab.index("torrent") + 1])

        if not event.is_directory and os.path.isfile(path):
            configuration = {
                "upload" : rand.randint(100000,999999),
                "torrent" : path
            }
            to = process_torrent(configuration)
            to.tracker_process()

if __name__ == "__main__":
    observer = Observer()
    event_handler = MyHandler()
    observer.schedule(event_handler, path='/config/torrents/', recursive=False)
    observer.start()
    try:
        while True:
            time.sleep(15)
            pass
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
