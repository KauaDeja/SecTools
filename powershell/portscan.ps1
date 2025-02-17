param($ip)
if (!$ip){
    echo "DESEC SECURITY - PORTSCAN"
    echo ".\portscan.ps1 192.168.0.1"
}else{
$topports = 21,22,23,25,80,443,3389

    try {
        foreach($porta in $topports)
        {
            if (Test-NetConnection $ip -Port $porta -WarningAction SilentlyContinue -InformationLevel   Quiet){
            echo "$porta - Porta Aberta"
            }else{
                echo "$porta - Porta Fechada"
            }

        }
    }catch{}
}



