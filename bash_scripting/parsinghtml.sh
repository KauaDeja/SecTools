#!/bin/bash

if [ "$1" == "" ]
then
        echo "DESEC SECURITY - HTML PARSING"
        echo "Modo de uso: $0 URL"
        echo "Exemplo: $0: businesscorp.com.br"

else
        $(wget -q $1)
        $(cat  index.html | grep href | cut -d"/" -f3 | cut -d '"' -f1 | grep "\." > lista.txt)
        echo "======================================================="
        echo "PESQUISANDO URL: $1"
        echo "======================================================="

        for url in $(cat lista.txt);
        do
                ip=$(host $url | grep "has address" | cut -d" " -f4)
                echo "IP: $ip | URL: $url"


        done
$(rm -rf index* lista.txt)
fi