#include <stdio.h>

int main()
{
  int A[3][3];    // matrix A     
  int B[3][3];    // matrix B
  int C[3][3];    // matrix to store their sum

  // add your code below
 printf("Please enter 9 values for matrix A:\n");
 for (int i = 0; i < 3; i++) {
  for (int j =0; j < 3; j++) {
 scanf("%d", &A[i][j]); 
}
 }
 printf("Please enter 9 values for matrix B:\n"); 
for (int i = 0; i < 3; i++) {
  for (int j =0; j < 3; j++) {
 scanf("%d", &B[i][j]); 
}
 }
printf("C = B + A =\n");
for (int i = 0; i < 3; i++) {
  for (int j =0; j < 3; j++) {
C[i][j] = A[i][j] + B[i][j];
if (j != 2) {
printf("%10i", C[i][j]);
} else {
printf("%10i\n", C[i][j]);
}
}
}
 



}
