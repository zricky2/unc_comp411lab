Exercise 1
This is an exercise in basic C programming involving the following concepts: a loop (for / while), conditionals (if-else), and input/output (scanf/printf).

Write a program that does the following: It prompts the user with "Enter a number from 1 to 20:\n" (note the newline after the colon), and reads the user's response. If the user's response was, say, 10, the program then prints a short message followed by the first 10 ordinal numbers (see this article), one per line, and then terminates. If the user enters a number that is outside of the 1..20 range, the program should print the error message "Number is not in the range from 1 to 20\n" (note the newline at the end), and terminate.

The file with your C program should be called ex1.c, and the compiled version called ex1. Compile the C program using the C compiler (cc or gcc), and test it with a few different inputs. You can find sample test input and output files as described above. Below is one execution scenario (program output is blue and input is red):

Enter a number from 1 to 20:

7

Here are the first 7 ordinal numbers:

1st

2nd

3rd

4th

5th

6th

7th

Here's another scenario:

Enter a number from 1 to 20:

22

Number is not in the range from 1 to 20

Assume that the ordinal numbers from 4 to 20 are all spelled with a th, i.e., 4th, 5th, ... 20th.

Exercise 2
This is an exercise that introduces the following concepts: floating-point numbers (doubles), and arithmetic and input/output of those numbers.

Write a program that requests 10 double-precision floating-point numbers (data type double), and prints their sum, minimum, maximum, and product to 5 decimal places. Specifically, the program should prompt the user with this message "Enter 10 floating-point numbers:\n" (note the newline after the colon). It should print the sum, minimum, maximum and product formatted exactly as shown (to 5 digits after the decimal point):

Enter 10 floating-point numbers:

1.45 -2e2 -2e-2 14 -10.0 0.01 -0.02 20 -3e1 +4e+0

Sum is -200.58000

Min is -200.00000

Max is 20.00000

Product is -389.76000

Tip: There is no need to use arrays for this exercise. You can calculate/update all four of the output values each time a new number is read from the input. In particular, the first value read becomes the initial sum, min, max and product. Then, every subsequent value read simply updates these four quantities. To print to 5 decimal places, carefully select the format string for printf(), specifically, the specifier, width and precision, after studying the tables given at http://www.cplusplus.com/reference/cstdio/printf/.

Name the file with the C program ex2.c. Compile it, save the executable as ex2, and test it on the sample input and output files provided.

Exercise 3
This is an exercise that introduces reading and writing octal and hexadecimal integers, as well as formatting spacing/padding. In this context, please note that decimal means a number written in base 10; it does not mean that it has a decimal point and a fractional part! Likewise, octal is base 8, and hexadecimal (or "hex") is base 16.

Write a program that requests six integers ("Enter six integers:\n") (note newline after colon), reads all of them, then prints all of them in the following format: (i) first print a header line as shown in the example below; then (ii) two integers per line, with each integer right-justified in a field of 10 characters, separated by two blank spaces. Each of the integers supplied could be in either decimal, octal or hexadecimal format, and your program should read it correctly. For output, each integer should be printed in decimal format.

For example, if the numbers input are 1, 010, 0x20, 25, 1000, -200, then the output should be exactly as follows:

Enter six integers:

1 010 0x20 25 1000 -200

1234567890bb1234567890

         1           8

        32          25

      1000        -200

Note: All numbers that start with a '0' are assumed to be octal, i.e., number in base 8 (Wikipedia article). Thus, "010" in octal is the number 0 + 8*1 = 8 in decimal. Similarly, numbers that start with "0x" are assumed to be hexadecimal, i.e., number in base 16 (Wikipedia article). Thus, "0x20" in hexadecimal is the number 0 + 2*16 = 32 in decimal.

Name the file with the C program ex3.c. Compile it to ex3 and test it on the sample input and output files provided.

Tip 1: Carefully study the format specifiers (%i, %d, %u, %o, %x) for scanf() from the reference provided above (http://www.cplusplus.com/reference/cstdio/scanf/).

Tip 2: Carefully study the width specifier for printf() from the reference provided above (http://www.cplusplus.com/reference/cstdio/printf/). There is an example on that page showing how to print a number into a field of 10 characters, preceded by blanks.

Exercise 4
Now redo Exercise 3 so that all integers in the input are strictly interpreted as decimal numbers, even if they start with a leading '0', i.e., the number "010" is the decimal number 10, not the octal form of 8. (The input will not contain any hex numbers starting with '0x'.) Tip: Carefully choose the format specifier (%i, %d, %u, %o, %x) for scanf().

For example, if the numbers input are 1, 010, 00020, 25, 1000, -200, then the output should be exactly as follows:

Enter six integers:

1 010 00020 25 1000 -200

1234567890bb1234567890

         1          10

        20          25

      1000        -200

Name the file with the C program ex4.c. Compile it to ex4 and test it on the sample input and output files provided.

Exercise 5
This is an exercise in nested loops and printing characters.

Write a program that repeatedly reads two integers in decimal format, the first being the width (i.e., number of columns) and the second being the height (i.e., number of rows) of a rectangle. The program prints the rectangle using the characters '+' for each corner and '-' or '|' for each line, and '~' for the interior. The numbers given will all be positive and non-zero and less than 100, except that to end the program, a single 0 is provided for the width (and the program immediately terminates without requiring a height to be entered).

Prompt the user to enter two numbers with "Please enter width and height:\n" (note newline at end)
Assume the user will only enter two valid values for width and height, or a single 0 to stop the program. The number entered will always be in decimal format, so "010" should be interpreted as ten not eight. Tip: Check the format specifier for scanf().
The program will print a rectangle with the specified width and height, using the characters specified.
The program repeats, prompting for the next input, until the user enters a single 0, in which case the program prints "End\n" (note the newline) and terminates.
For example, the following is one execution scenario:

Please enter width and height:

5

3

+---+

|~~~|

+---+

Please enter width and height:

6

2

+----+

+----+

Please enter width and height:

2

2

++

++

Please enter width and height:

4

1

+--+

Please enter width and height:

1

1

+

Please enter width and height:

0

End

First test your program by running it through the execution scenario above, and make sure it produces exactly the same output. Name the file with the C program ex5.c. Compile it to ex5 and test it on the sample input and output files provided.
