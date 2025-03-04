#!/bin/bash

lynx --dump "https://google.com/search?&q=site:desecsecurity.com+ext:pdf" | grep ".pdf" | cut -d "=" -f2 | grep -Ev "site:|accounts|img" | sed 's/...$//' > arquivos.txt

echo "BUSCANDO POR ARQUIVOS PDF"
for arquivo in $(cat arquivos.txt);
        do
                echo "Arquivo encontrado $arquivo"
                mkdir arquivos_extraidos | wget -q $arquivo -P arquivos_extraidos  | exiftool * 
        done

rm -rf arquivos.txt
