#!/bin/bash

if [ "$1" == "" ]
then
        echo "DESEC SECURITY - PORT KNOCING - MALWARE"
        echo "Modo de uso: $0 IP"
        echo "Exemplo: $0 10.0.0.1"
else
        echo -e "13\n37\n30000\n3000\n1337" > portas.txt
        for porta in $(cat portas.txt);
        do
                echo "TESTANDO CONEXÃO: $1 $porta"
                hping3 -S -p $porta -c 1 $1 2>/dev/null | grep "TESTANDO"
        done
        echo "PORTA ABERTA:" | nc -zv $1 1337
fi
