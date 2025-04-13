#!/usr/bin/python

import socket

tcp = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
tcp.connect(("172.16.1.108",21))

banner = tcp.recv(1024)
print(banner)

tcp.send("USER ftp\r\n".encode())
user = tcp.recv(2048)
print(user)

tcp.send("PASS ftp\r\n".encode())
pw = tcp.recv(2048)
print(pw)

tcp.send("HELP \r\n".encode())
tcp.send("PWD \r\n".encode())
c1 = tcp.recv(2048)

print(c1)
