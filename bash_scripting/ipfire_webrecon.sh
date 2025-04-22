#!/bin/bash

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

