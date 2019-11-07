//This is an exercise that introduces octal and hexadecimal integers, as well as formatting spacing/padding.

#include <stdio.h>

int main() {

int a, b, c, d, e, f;
  
  printf("Enter six integers:\n");
  scanf("%d %d %d %d %d %d", &a, &b, &c, &d, &e, &f);

  printf("1234567890bb1234567890\n");
  printf("%10d  %10d\n%10d  %10d\n%10d  %10d\n", a, b, c, d, e, f);

}
