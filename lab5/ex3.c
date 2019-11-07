#include <stdio.h>
#include <string.h>

char animals[20][15];
char lyrics[20][60];
int  number, length;

void nurseryrhyme(int current) {
if (current == number -1) { //base case
printf("%*s", current, "");  
printf("She swallowed the %s to catch the %s;\n",animals[current-1], animals[current]);
} else if (current == 0) {
  printf("There was an old lady who swallowed a %s;\n", animals[current]);
  nurseryrhyme(current+1);
} else if (current < number-1) {
  printf("%*s", current, "");
  printf("She swallowed the %s to catch the %s;\n", animals[current-1], animals[current]);
  nurseryrhyme(current+1);
}
printf("%*s", current, "");
printf("I don't know why she swallowed a %s - %s", animals[current], lyrics[current]);
}

int main() {
  int i=0;

  while (1) {
    fgets(animals[i], 15, stdin);
    if (strcmp(animals[i], "END\n") == 0){
      break;
    }
    length = strlen(animals[i])-1;
    animals[i][length] = '\0';
    fgets(lyrics[i], 60, stdin);
    i++;
  }

  number = i;

  nurseryrhyme(0);
}
