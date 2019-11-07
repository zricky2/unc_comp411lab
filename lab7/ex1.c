#include <stdio.h>

int AA[100];  		// linearized version of A[10][10]
int BB[100];  		// linearized version of B[10][10]
int CC[100];  		// linearized version of C[10][10]
int m;       		// actual size of A, B and C is [m][m], where m is at most 10

int main() {
// scan for m
scanf("%d", &m);

// scan for A
for (int j = 0; j < m; j++) {
for (int i = 0; i < m; i++) {
  scanf("%d", &AA[j*m+i]);
}
}

// scan for B
for (int j=0; j < m; j++) {
for (int i =0; i < m; i++) {
  scanf("%d", &BB[j*m+i]);
}
}

// matrix multiply
for (int j = 0; j < m; j++) { 
 for (int i = 0; i < m; i++) {
  CC[j*m+i]=0; 
   for (int k = 0; k < m; k++) {
     CC[j*m+i] += AA[j*m+k] * BB[k*m+i];
     }
   }
}

//print C
for (int j =0; j < m; j++) {
 for (int i =0; i < m; i++) {
  printf("%d ", CC[j*m+i]);
 }
printf("\n");
}

}
