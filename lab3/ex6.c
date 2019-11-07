#include <stdio.h>

int NchooseK(int n, int k); // function prototype;

int main()
{
int n, k;

printf("Enter two integers (for n and k) separated by space:\n");
scanf("%d%d", &n, &k);
while (n != 0 || k != 0) {
printf("%i\n", NchooseK(n,k));
printf("Enter two integers (for n and k) separated by space:\n");
scanf("%d%d", &n, &k);
}
printf("%d\n", 1);

}

// You can assume that k and n are non-negative integers,
// and that k will never be greater than n.
// NchooseK(n, 0) = 1
// NchooseK(n, n) = 1
// NchooseK(n, k) = NchooseK(n-1, k-1) + NchooseK(n-1, k)
int NchooseK(int n, int k) {
//base case 
if (k == 0 || k == n) {
return 1;
} else {
return NchooseK(n-1, k-1) + NchooseK(n-1, k);
}

}
