#include <stdio.h>

int A[10][10];
int B[10][10];
int C[10][10];
int m;
int main() {
//scan m value
scanf("%d", &m);
//scan for A
for (int j =0; j < m; j++) {
 for (int i =0; i < m; i++) {
  scanf("%d", &A[j][i]);
 }
}
// scan for B
for (int j =0; j < m; j++) {
 for (int i =0; i < m; i++) {
  scanf("%d", &B[j][i]);
 }
}


// multiply

 for (int j = 0; j < m; j++) { 
    for (int i = 0; i < m; i++) { 
         C[j][i] = 0; 
       for (int k = 0; k < m; k++) { 
          C[j][i] += A[j][k]*B[k][i]; 
       }
    }
}


//print C
for (int j =0; j < m; j++) {
 for (int i =0; i < m; i++) {
  printf("%6d", C[j][i]);
 }
printf("\n");
}



}
