#include <stdio.h>
#include <string.h>
#include <ctype.h>

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

  puts("Your input in reverse is:");
  puts(reverse);
int b = 0;

for (int a = 0; a < length; a++) {

if (isspace(reverse[b]) || ispunct(reverse[b])) {
b++;
a--;
continue;
 }
if (isspace(text[a]) || ispunct(text[a])) {
  continue;
 }

if (isalpha(text[a]) && isalpha(reverse[b])) {
if (isupper(text[a]) && isupper(reverse[b])) {
if (text[a] != reverse[b]) {
pexist++;
break;
   }
  }
if (isupper(text[a]) && islower(reverse[b])) {
if (tolower(text[a]) != reverse[b]) {
pexist++;
break;
   }
  }

if (islower(text[a]) && isupper(reverse[b])) {
if (toupper(text[a]) != reverse[b]) {
pexist++;
break;
   }
  }

if (islower(text[a]) && islower(reverse[b])) {
if (text[a] != reverse[b]) {
pexist++;
break;
   }
  }
 } else {
if (text[a] != reverse[b]) {
pexist++;
break;
 }
  }
b++;
}


 if (pexist == 0) {
  printf("Found a palindrome!\n");
  }
}
