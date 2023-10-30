import socket
 
client = socket.socket()
client.connect(('127.0.0.1', 5180))
client.send("scene(10087)".encode())

client.close()
