#Este script é um programa feito para quebrar hashes unix do tipo MD5 e SHA512.
import re
from passlib.hash import sha512_crypt, md5_crypt


def quebrar_hash_md5(b_hash, b_salt ):

    with open(r'C:\Users\user\Desktop\user\sectools\python\brute_force_hash\word.txt','r') as file:
        for senha in file:
            senha = senha.strip()
            result = md5_crypt.hash(senha, salt=b_salt)
            print(result)

            if result == b_hash:
                print(f"Senha encontrada: {senha}")
                break
            else:
                print(f"Testando.. {senha}")
pass

def quebrar_hash_sha512(b_hash, b_salt ):

    with open(r'C:\Users\user\Desktop\user\sectools\python\brute_force_hash\word.txt','r') as file:
        for senha in file:
            senha = senha.strip()
            result = sha512_crypt.hash(senha, rounds=5000,salt=b_salt)
            print(result)

            if result == b_hash:
                print(f"Senha encontrada: {senha}")
                break
            else:
                print(f"Testando.. {senha}")
pass

vhash = input("Digite o hash linux completo:  ")
vsalt = input("Digite o salt: (Sem cifrão): ")

if re.search("^\\$1\\$",vhash): #A duas barras é usada para anular o "$" que é um caracter especial
    quebrar_hash_md5(vhash, vsalt)
else:
    quebrar_hash_sha512(vhash, vsalt)
