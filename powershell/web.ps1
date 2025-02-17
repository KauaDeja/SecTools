$web = Invoke-WebRequest -Uri "http://www.businesscorp.com.br" -Method Options
echo "O servidor está rodando: "
$web.Headers.Server
echo ""
echo "O servidor aceita os métodos: "
$web.headers.allow
echo ""
echo "Links encontrados: "
$web2 = Invoke-WebRequest -Uri "http://www.businesscorp.com.br"
$web2.Links.href | Select-String http://