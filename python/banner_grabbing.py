#!/usr/bin/python3

import socket,sys

ip = "172.16.1.3"
portas = [33024,33054,43001,44289,49222]

for porta in portas:
    print(f"TESTANDO CONEXÃO COM A PORTA {porta}")
    print ("--------------------------------------\n\n\n")
    meusocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    if meusocket.connect_ex((ip,porta)) == 0:
        print(f"PORTA ABERTA: {porta}")
        banner = meusocket.recv(1024)
        print(banner)
