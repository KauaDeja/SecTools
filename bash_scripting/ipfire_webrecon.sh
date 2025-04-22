#!/bin/bash
#Para mais detalhes desse scritp acessar o link da documentação.
#https://www.notion.so/Web-Scan-IP-Fire-1dd3ffba6f1f8020aaa3e8a4ad4e54cd?pvs=4

for file in $(cat wordlist_ipfire.txt);
do
        result_file=$(curl -s -I -k -H "User-Agent: Mozilla" https://172.16.1.100:444/cgi-bin$file -w "%{http_code}" -o /dev/nul)

        if [ "$result_file" == "200" ];
        then
                echo -e "\e[32mArquivo $file encontrado. [CODE: $result_file]\e[0m"
        else
                echo -e "Chegando arquivo $file [CODE: $result_file]"
        fi
done

