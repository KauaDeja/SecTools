#!/usr/bin/python
import socket
import sys

if len(sys.argv) !=3:
    print("Modo de uso: python smtpenum.py IP usuario")
    sys.exit(0)

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.connect((sys.argv[1], 25))
banner = tcp.recv(1024)
print(banner)

tcp.send(f"VRFY {sys.argv[2]} \r\n".encode())
user = tcp.recv(1024)
print(user)
