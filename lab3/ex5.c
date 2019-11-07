#include <stdio.h>
#include <string.h>
#define MAX_BUF 1024

int main () {

  char buf[MAX_BUF];
  int length;
  // other stuff

fgets(buf, MAX_BUF, stdin);
length = strlen(buf)-1;
//buf[length+2] = '\0';
int i =0;
  do {
      // read a line
        // calculate its length
        // modify the line by switching characters
        // print the modified line
if (buf[0] == '\0') {
 break;
} else if (buf[i] == 'E' || buf[i] == 'e') {
printf("%d",3);
} else if (buf[i] == 'I' || buf[i] == 'i') {
printf("%d",1);
} else if (buf[i] == 'O' || buf[i] == 'o') {
printf("%d",0);
} else if (buf[i] == 'S' || buf[i] == 's') {
printf("%d",5);
} else {
printf("%c", buf[i]);
}
i++;
if (i == length) {
printf("\n");
fgets(buf, MAX_BUF, stdin);
length = strlen(buf)-1;
i=0;
}
 } while (i < length);

}
