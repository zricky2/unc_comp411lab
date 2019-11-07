//This is an exercise in nested loops and printing characters.
#include <stdio.h>

int main() {
int width;
int height;


printf("Please enter width and height:\n");
scanf("%d", &width);
while (width != 0) {
scanf("%d", &height);
for (int i =1; i <= height; i++) {
        for (int j =1; j <= width; j++) {
             if ((i == 1 && j == width) || (i == height && j == width)) {
                                printf("+\n");
                        } else if ((i == 1 && j == 1) || (i == height && j == 1)) {
                        printf("+");
			} else if (i == 1 || i == height) {
                          printf("-");
                        } else if (j == width) {
                         printf("|\n");
                         } else if(j == 1) {
                          printf("|");
                } else {
                        printf("~");
                }
        }


}
printf("Please enter width and height:\n");
scanf("%d", &width);
}

printf("End");
}

