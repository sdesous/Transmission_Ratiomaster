from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from code.process_torrent import process_torrent
import random as rand
import time

class MyHandler(FileSystemEventHandler):
    def on_created(self, event):
        if not event.is_directory:
            configuration = {
                "upload" : rand.randint(100000,999999),
                "torrent" : event.src_path
            }
            to = process_torrent(configuration)
            to.tracker_process()

if __name__ == "__main__":
    observer = Observer()
    event_handler = MyHandler()
    observer.schedule(event_handler, path='./torrent', recursive=False)
    observer.start()
    try:
        while True:
            time.sleep(15)
            pass
    except KeyboardInterrupt:
        observer.stop()
    observer.join()