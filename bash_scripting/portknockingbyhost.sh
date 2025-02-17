#Este script vai receber como único argumento uma rede, em seguida fazer um scan para identificar quais os hosts ativos e por fim fazer um Port Knocking nos hosts ativos para abrir a porta 1337, no qual está com o malware.
#!/bin/bash

if [ "$1" == "" ]
then
        echo "DESEC SECURITY - PORT KNOCING - MALWARE"
        echo "Modo de uso: $0 IP"
        echo "Insira a rede: $0 10.0.0"
else
        for host in {50..254};
        do
                ip_encontrado=$(ping -c 1 $1.$host | grep "64 bytes"  | cut -d " " -f4 | sed 's/.$//')

                if [ "$ip_encontrado" != "" ]
                then
                                echo -e "13\n37\n30000\n3000\n1337" > portas.txt
                                for porta in $(cat portas.txt);
                                do
                                        echo "--------------------------------------------------------------"
                                        echo "TESTANDO CONEXÃO: $ip_encontrado $porta"
                                        hping3 -S -p $porta -c 1 $ip_encontrado 2>/dev/null | grep "TESTANDO"
                                done
                        
                        echo "PORTA ABERTA:" | nc -zv $ip_encontrado 1337
                fi
        done                
fi
