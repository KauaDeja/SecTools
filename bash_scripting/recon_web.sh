#!/bin/bash

echo "----------------------------------------------------------------------------------------------------"
echo "                                                                                                    "
echo -e "\e[33m|-                       WALL-E WEB - VARREDURA DE ARQUIVOS E DIRETORIOS                         -|\e[0m"
echo "                                                                                                    "
echo "----------------------------------------------------------------------------------------------------"
if [ "$1" == "" ]
then
        echo "USAGE: .\dns_recon <url>"
        echo "USAGE: .\dns_recon businesscorp.com.br"
else

servico_web=$(curl -s -I -H "User-Agent: Mozilla" $1 | grep -i "Server:" | cut -d " " -f 2)
echo -e "\e[34m-> WebServer identificado: $servico_web\e[0m\n\n"
echo "Buscando por Diretorios e Arquivos:"

for palavra in $(cat lista.txt)
do
    resposta_dir=$(curl -s -H "User-Agent: Mozilla" -o /dev/null -w "%{http_code}" "$1/$palavra/")
    resposta_file=$(curl -s -H "User-Agent: Mozilla" -o /dev/null -w "%{http_code}" "$1/$palavra")

    if [[ "$resposta_dir" == "200" ]]; then
        echo -e "\e[32mDiretório encontrado: $1/$palavra/ [CODE: $resposta_dir]\e[0m"
    fi

    if [[ "$resposta_file" == "200" ]]; then
        echo -e "\e[32mArquivo encontrado: $1/$palavra [CODE: $resposta_file]\e[0m"
    fi
done
fi
