/* Example: bubble sort strings in array */

#include <stdio.h>  /* Need for standard I/O functions */
#include <string.h> /* Need for strlen() */


#define NUM 25   /* number of strings */
#define LEN 1000  /* max length of each string */


int my_compare_strings(char string1[], char string2[]) {

  /* Write code here to compare string1 and string2, character by character.
     WITHOUT USING ANY C STRING LIBRARY FUNCTIONS.

     The max length of the strings is LEN, though they may be shorter so look
     for the string terminators.

     This function should return:
      -1 if string1 comes before string2 in alphabetical order
       0 if string1 is the same as string2
      +1 if string1 comes after string2 in alphabetical order

      Here, alphabetical order is defined simply by the numerical value
      of the characters in the string, from left to right.  See the writeup
      for more details.
  */
for (int i =0; i < LEN; i++) {
  if (i == strlen(string1)-1 || i == strlen(string2)-1) {
   if (i == strlen(string1)-1 && i != strlen(string2)-1) {
    return("%d", -1);
   } else if(i == strlen(string1)-1 && i == strlen(string2)-1) {
    return("%d", 0); 
   } else {
    return("%d", 1);
   }
 } else {
  if (string1[i] < string2[i]) {
 return("%d", -1);
 } else if(string1[i] > string2[i]) {
 return("%d", 1);
 } else {
 continue; 
 }
}
}
}
// problem is that there is \n at the end of the string

void my_swap_strings(char string1[], char string2[]) {
  char temp[LEN];    // char variable used in swapping one character at a time

  /* Write code here to swap the contents of string1 and string2, one
     character at a time, WITHOUT USING ANY C STRING LIBRARY FUNCTIONS. 

     The max length of the strings is LEN, though they may be shorter, so look
     for the string terminators.
  */
 
 for (int i =0; i < LEN; i++) {
   temp[i] = string1[i];
   string1[i] = string2[i];
   string2[i] = temp[i];

 }
}

int main()
{
  char Strings[NUM][LEN];

  printf("Please enter %d strings, one per line:\n", NUM);

  /* Write a for loop here to read NUM strings.

     Use fgets(), with LEN as an argument to ensure that an input line that is too
     long does not exceed the bounds imposed by the string's length.  Note that the
     newline and NULL characters will be included in LEN.
  */
  for (int i =0; i < NUM; i++) {
   fgets(Strings[i], LEN, stdin);
  }
 

 puts("\nHere are the strings in the order you entered:");

  /* Write a for loop here to print all the strings. */
 for (int i = 0; i < NUM; i++) {
   printf("%s",Strings[i]);
  
 } 
  /* Bubble sort */
  /* Write code here to bubble sort the strings in ascending alphabetical order

     Use the function my_compare_strings() to compare two strings.  If they are out of order,
     use the function my_swap_strings() to swap their contents.

  */

 for (int i = 0; i < NUM-1; i++) {
  for (int j = i+1; j < NUM; j++) {
   if (my_compare_strings(Strings[i],Strings[j]) == 1) {
    my_swap_strings(Strings[i],Strings[j]);
   }
  }
 }
  /* Output sorted list */
  
  puts("\nIn alphabetical order, the strings are:");     
  /* Write a for loop here to print all the strings. Feel free to use puts/printf
     etc. for printing each string.
  */
  
  for (int i=0; i < NUM; i++) {
  printf("%s",Strings[i]);
  }

}

