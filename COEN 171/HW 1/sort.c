# define HIGH 8
#include <stdio.h>
typedef int numbers[HIGH];
numbers a;

void readArray(void){
    int i;
    printf("type something in");
    for (i = 0; i < HIGH; i ++){
        scanf("%d", &a[i]);
    }
}

void writeArray(void){
    int i;
    printf("Now printing...\n");
    for (i = 0; i < HIGH; i++){
       printf("%d", a[i]);
    }
    printf("\n");
}

/*void quicksort(int a[], int m, int n){
    int i; 

    if (n > m){
        i = partition(a,m,n);
        quicksort(a, m, i);
        quicksort(a, i+1, n);
    }
} */ 

void exchange(int *a, int *b){
    int t;

    t = *a;
    *a = *b;
    *b = t;
}


int partition(int a[], int y, int z ){
    int j, i, x;
    x = a[z];
    i = y - 1;
    j = z;
    
    while (i <= j){
        while(a[j] > x){
            j = j - 1;
        }

        while(a[i] < x){
            i = i + 1;
        }

        if (i <= j){
            exchange(&a[i], &a[j]);
        }
    }
    return i + 1;
}

void quicksort(int a[], int m, int n){
    int i; 

    if (m < n){
        i = partition(a,m,n);
        quicksort(a, m, i);
        quicksort(a, i+1, n);
    }
    return;
}

int main (void){
    printf("we here");
    readArray();
    quicksort(a, 0, HIGH - 1);
    writeArray();
    return 0;
}