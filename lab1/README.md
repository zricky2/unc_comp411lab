Exercise 1
Modify the program so that it prompts you to enter the radius value as input in centimeters using the prompt "Enter radius (in cm):\n", but displays the result in square inches. (One inch is 2.54 cm exactly.) Use pico to edit the file to make this modification, and save the file as ex1.c inside your lab1 subfolder under the comp411lab folder in your home directory.

Compile this program to create an executable file called ex1 by typing

% gcc ex1.c -o ex1

Run the executable ex1 on a couple of different inputs to verify that it is working correctly. The inputs and outputs can be from the keyboard/terminal; you do not need to use redirection of input/output from/to files for this exercise. Here is an example execution scenario (user input is shown in red, and program output in blue):

% ./ex1

Enter radius (in cm):

2.54

Circle's area is 3.14 (sq in).

Reminder: We always put a "./" before the name of the executable when executing a program in your current working directory, hence ./ex1 above.

Exercise 2
Copy the file ex1.c to ex2.c (so you do not accidentally edit ex1.c any further). Modify the program in ex2.c to also compute and display the circumference. Compile it to an executable called ex2, and run it. Here is an example execution scenario:

% ./ex2

Enter radius (in cm):

2.54

Circle's area is 3.14 (sq in).

Its circumference is 6.28 (in).

Exercise 3
Copy the file ex2.c to ex3.c. Modify the program in ex3.c to make it work on multiple inputs. In particular, it should repeatedly ask for a radius value (in centimeters), and print the corresponding area (in square inches) and circumference (in inches), until the user enters the value 0 as radius. At that point, the program should print the area and circumference (both 0), and then terminate.

Compile this program to make an executable called ex3, and run it, feeding it several radius values from the keyboard, and verifying that the values it displays are correct. A single run of the program should be able to compute as many of these calculations as you want, until you enter 0.

% ./ex3

Enter radius (in cm):

2.54

Circle's area is 3.14 (sq in).

Its circumference is 6.28 (in).

Enter radius (in cm):

5.08

Circle's area is 12.57 (sq in).

Its circumference is 12.57 (in).

Enter radius (in cm):

0

Circle's area is 0.00 (sq in).

Its circumference is 0.00 (in).
