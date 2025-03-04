#!/usr/bin/python3

import re
import requests
from bs4 import BeautifulSoup

#Fazendo requisição para a página de notícias
url = "http://businesscorp.com.br"
response = requests.get(url)
html = response.text

soup = BeautifulSoup(html, 'html.parser')
emails = soup.find_all('p')
regex_email = r'[a-zA-Z0-9]+@[a-zA-Z]+[a-z-A-Z]{2,}'


email_limpos = []

for p in emails:
    texto = p.get_text()
    email_limpos.extend(re.findall(regex_email, texto))

print(f"Os emails encontrados em {url} foram:")
print("|------------------------------------|")
print ("\n".join(email_limpos))
                                  