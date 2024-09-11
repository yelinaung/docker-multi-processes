import http.server
import socketserver
import signal
import sys


def signal_handler(sig, frame):
    print(f"Server on port {PORT} shutting down gracefully...")
    sys.exit(0)


if len(sys.argv) != 2:
    print("Usage: python server.py <port>")
    sys.exit(1)

PORT = int(sys.argv[1])
signal.signal(signal.SIGTERM, signal_handler)

Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving on port {PORT}")
    httpd.serve_forever()
