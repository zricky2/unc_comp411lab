#include <stdio.h>
#include <string.h>

#define MAX 1000 /* The maximum number of characters in a line of input */

int main()
{
  char text[MAX], c, reverse[MAX];
  int i,j;
  int lowercase, uppercase, digits, other;
  int length;
  int pexist =0;
  printf("Type some text (then ENTER):\n");
  
 
 fgets(text, MAX, stdin);
 length = strlen(text)-1;
 j = length -1;
 int x  =0;
 for (i = j; i >= 0; i--) {
  reverse[x] = text[i];
  x++;
 }
reverse[length] ='\0'; 
 for (i = 0; i < length; i++) {  
 if (text[i] != reverse[i]) {
 pexist++;
 break; 
 }
 }

  puts("Your input in reverse is:");
  puts(reverse);
  if (pexist == 0) {
  printf("Found a palindrome!\n");
  }
}
