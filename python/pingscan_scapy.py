from scapy.all import *

conf.verb = 0
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)

for ip in range(1, 255):
    iprange = f"192.168.0.{ip}"
    pIP = IP(dst=iprange)
    pacote = pIP/ICMP()
    resp, noresp = sr(pacote,timeout=1, verbose=0)

    for resposta in resp:
        print(resposta[1][IP].src, "UP")
    
    for sem_resposta in noresp:
        print(resposta[1][IP].dst, "DOWN")

