import sys
from code.process_torrent import process_torrent

path = sys.argv[1]

configuration = {
	"torrent" : path
}

to = process_torrent(configuration)
to.tracker_process()
