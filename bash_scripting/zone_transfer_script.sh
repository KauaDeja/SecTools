#!/bin/bash

if [ "$1" == "" ]
then
    echo "USAGE: .\zone_transfer_script <dominio>"
    echo "USAGE: .\zone_transfer_script businesscorp.com.br"
else

    host -t ns businesscorp.com.br | cut -d " " -f4 > list_ns.txt
    for ns in $(cat list_ns.txt);
        do

            echo "-----------------------------"
            echo "-----------------------------"
            echo "TENTANDO ZONE TRANSFER EM: $1"
            echo "-----------------------------"
            echo "-----------------------------"
            host -t AXFR $1 $ns
        done
rm -rf list_ns.txt
fi
