//
//  Behnam Dezfouli
//  CSEN, Santa Clara University
//

// This program implements a client that connects to a server and transfers the bytes read from a file over the established connection
//
// The input arguments are as follows:
// argv[1]: Sever's IP address
// argv[2]: Server's port number
// argv[3]: Source file
// argv[4]: Destination file at the server side which includes a copy of the source file



#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <arpa/inet.h>

#define    SIZE 10

int main (int argc, char *argv[])
{
    int        sockfd = 0;              // socket descriptor
    char       net_buff[SIZE];          // to hold the bytes read from socket
    char       file_buff[SIZE];         // to hold the bytes read from source file
    struct     sockaddr_in serv_addr;   // server address structure
    int        net_bytes_read;          // numer of bytes received over socket
    FILE       *source_file;            // pointer to the source file
    
    if (argc < 5)
    {
        printf ("Usage: ./%s <server ip address> <server port number> <source file>  <destination file>\n", argv[0]);
        return 1;
    }
    
    
    // Make sure intial values are zero
    memset (net_buff, '0', sizeof (net_buff));
    memset (file_buff, '0', sizeof (file_buff));
    memset (&serv_addr, '0', sizeof (serv_addr));

    int sockfd = socket (AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0){
        printf ("cannot create");
        return 0;
    }

    bzero (buffer, 256);
    n = read(newsockfd, biffer, 255);
    if (n < 0)
        printf ("ERROR reading from socket");
    printf ("Here is the message: %s\n", buffer);

    int connect (int sockfd, const struct sockaddr *addr, socklent_t addrlen);
   
    *source_file = fopen("lab2.txt", "wb");
    if (!*source_file){
        perror("connection failed");
        exit(EXIT_FAILURE);
    }

    while ((net_bytes_read = recv(sockfd, net_buff, sizeof(net_buff), 0)) > 0)
        fwrite (net_buff, 1 ,net_bytes,read, source_file);

    printf("FILE recieved successfully.\na");

    fclose (source_file);
    fclose(sockfd);
    

    
    
    return 0;
}

