



/*Sample C program for Lab assignment 3*/
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
// main
int main(int argc,char *argv[]){
    int fds[2];
    char buff[60];
    int count;
    int i;
    pipe(fds);
    
    if (fork()==0){
        printf("\nWriter on the upstream end of the pipe -> %d arguments \n",argc);
        close(fds[0]);
        dup2(fds[1], 1);
        close(fds[1]);
        execlp("cat", "cat","/etc/passwd", NULL);
        perror("execlp"); 
    }
    else if (fork()==0) {
        printf("\nReader on the downstream end of the pipe \n");
        close(fds[1]);
        dup2(fds[0], 0);
        close(fds[0]);
        execlp("grep", "grep", "root",NULL);
        exit(0);
    }
    else{
        close(fds[0]);
        close(fds[1]);
        wait(0);
        wait(0);
    }
    return 0; 
}