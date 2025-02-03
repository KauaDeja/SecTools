#!/bin/bash

if [ "$1" == "" ]
then
        echo "PORTSCAN"
        echo "O PROGRAMA ESPERA UM ARGUMENTO VÁLIDO"
        echo "MODO DE USO: $0 192.168.0 80"
else
for ip in {1..254};
do
        hping3 -S -p $2 -c 1 $1.$ip 2>/dev/null | grep "flags=SA" | cut -d" " -f 2 | cut -d "=" -f 2 ;
done
fi