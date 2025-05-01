#!/bin/bash
#Durante um pentest encontramos um github com o código que a aplicação usava para gerar o hash do sistema. O código fazia um md5 na string, em seguida um base64, em seguida um sha1.

#Descubra a senha do hash gerado pelo sistema:

#806825f0827b628e81620f0d83922fb2c52c7136

#Dica: utilize a wordlist do john (password.lst)
#Dica2: Crie um script para ler a wordlist e aplicar o algoritmo acima.

for senha in $(cat /usr/share/john/password.lst);
do
        senha_md5=$(echo -n "$senha" | md5sum | cut -d " " -f1 )
        base64_encode=$(echo -n "$senha_md5" | base64)
        senha_alg=$(echo -n "$base64_encode" | sha1sum | cut -d " " -f1)

        echo "Testando: $senha -> $senha_alg"
        if [[ "$senha_alg" == "806825f0827b628e81620f0d83922fb2c52c7136" ]]; then
                echo "O hash é: $senha_alg"
                echo "A senha encontrada é: $senha"
                break
        fi
done
