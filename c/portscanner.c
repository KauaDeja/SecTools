#include <stdio.h>

#include <sys/socket.h>

#include <netdb.h>



int main(int argc, char *argv[]){

	

	int meusocket;

	int conecta;

	int porta;

	int inicio = 0;

	int final = 65535;

	char *destino;

	destino = argv[1];



	struct sockaddr_in alvo;

	

	for(porta=inicio; porta<final; porta++){



	//Para entender essa estrutura é interessante executar um 'man socket', 'man 7 ip' e cat /etc/protocols

	meusocket = socket(AF_INET, SOCK_STREAM, 0);

	alvo.sin_family = AF_INET;

	alvo.sin_port = htons(porta);

	alvo.sin_addr.s_addr = inet_addr(destino);



	conecta = connect(meusocket, (struct sockaddr *)&alvo, sizeof alvo);



	if(conecta == 0){

		printf("STATUS - Porta aberta: %d \n", porta);

		close(meusocket);

		close(conecta);

	}else{

		close(meusocket);

		close(conecta);

	}



	}

}

