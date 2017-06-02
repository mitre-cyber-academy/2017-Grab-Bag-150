import socket
import sys

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.bind(('', 6900))
sock.listen(1)
conn, addr = sock.accept()
print 'Connected by', addr
message = """{ "command": "main", "room": "4", "players": "50" }"""
conn.sendall(message)
conn.close()
print >>sys.stderr, 'closing socket'













