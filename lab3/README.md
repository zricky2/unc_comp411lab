Reading
Prior to beginning this tutorial, carefully review the following material from the Perry and Miller textbook: Chapters 6 (string basics), 19 (character types), and 21-23 (arrays).

Declaring strings in C: Unlike other high-level languages that explicitly provide support for strings (e.g., the String class in Java), there is no built-in type for strings in C. Instead, strings are handled as arrays of characters. Here are some ways of declaring strings in C:


        char String1[10];               // an uninitialized string of up to 10 characters

        char String2[10] = "Hello";     // a string with space for 10 characters, initialized to "Hello"

        char String3[10] = { 'H', 'e', 'l', 'l', 'o', '\0'}
                                        // same as previous one, but note the '\0' terminator

        char String4[]   = { 'H', 'e', 'l', 'l', 'o', '\0'}
                                        // a strong with space for 6 characters; compiler counts for you
String length and termination: Unlike Java, the length of the string is not stored within the data structure. The entire data structure is simply the array of characters, and information about its size is typically not encoded by the compiler into the executable. Thus, at runtime, the actual length of each string is typically unknown. Instead a different approach is used.

Each string is terminated using a special character called the "NULL" character, which is ASCII 0, and can be represented as '\0'. Hence, in the examples above, String3 and String4 were initialized as character arrays, and the string terminator '\0' had to be explicitly used to terminate the strings. There is a standard C string library (string.h) that provides many useful string processing functions, all of which expect NULL-terminated strings. You access those functions by using the #include<string.h> directive at the top of the main program file.

The NULL character is automatically appended by the compiler when the following declaration is used:


        char String2[10] = "Hello";     // a string with space for 10 characters, initialized to "Hello"
With this type of declaration, the use of double quotes ("Hello") explicitly indicates that a string is intended and, therefore, the compiler automatically appends a NULL character, making it equivalent to the character array: { 'H', 'e', 'l', 'l', 'o', '\0'}

If you forget to terminate the string, none of the C string functions will work properly. For instance, if String3 were not terminated using '\0', a subsequent call to printf(String3) could very well produce output like: HellojB%$@#($M. Even worse, printf() might go out of the bounds of space available to your program while looking for the string terminator, most likely causing a "segmentation fault" error.

When declaring strings, be careful to count the space that will be needed by the terminator when allocating space for the string variable. Thus, the string "Hello" needs 6 characters, not 5. Likewise, String1 above can store at most 9 real characters, plus its terminator. Similarly, String2 can have at most 9 real characters plus the terminator, even though it is initialized to a shorter string. Thus, String2's initial contents could very well be { 'H', 'e', 'l', 'l', 'o', '\0', '#', '@', '%', '$'}, where the last four characters are junk; these trailing characters are ignored by all C library functions because the string terminates at the '\0'.

All C library routines for reading and writing strings --- scanf(), printf(), and others we will soon learn --- always append the terminator at the end of any new string created or updated. However, if you are manually creating a new string and copying individual characters into it, it is your responsibility to append a terminator at the end. For example:


        char String2[10] = "Hello";     // a string with space for 10 characters, initialized to "Hello"
        ...
        ...
        String2[2] = '\0';              // puts a string terminator after the 'e'
The above code fragment turns String2 into { 'H', 'e', '\0', 'l', 'o', '\0', '#', '@', '%', '$'}, which is effectively the string "He".

Note
For the exercises below, create a folder lab3 inside the comp411lab folder that you already have under your home directory on the class server (comp411-2fa19.cs.unc.edu). For the exercises below, you will code your C programs in the files ex1.c, ex2.c, ex3.c, ex4.c, ex5.c and ex6.c, respectively. Sample input and output files are provided in the folder /home/students/montek/comp411/samples/lab3.

Exercise 1
Compile and run the program analyze.c. Modify the program to replace the loop containing repeated getchar() calls with a single call to fgets(). Please first review P&M Chapter 6 in its entirety for basics on strings. Also review P&M pp. 235-236 for details on the fgets() function, but here is a quick tip on its usage:

fgets(text, MAX, stdin);

fgets stands for "get string from file", and it stores the string read into text, reading up to a maximum number of MAX characters, from the file specified in the third argument, which in our case is the "standard input" or stdin (meaning keyboard, or a file if input is redirected using "<").

Once you make this change, however, you will no longer have the length of the string in length, so you will have to use the C library function strlen() (see P&M pp. 176-177 for details) to compute the length of the string.

Note that the string read using fgets has a newline character at the end, which is not what we want. Unless you carefully exclude the newline character, simply reversing the string with the newline will put the newline character at the beginning of the new string. Likewise, strlen includes this newline character in the length of the string. There are multiple ways to deal with this issue. One option is to modify the string to eliminate the newline from its end by terminating the string at the position of the newline character. Another option is to be aware of the newline, and construct your reversing code to iterate properly over the initial string, without copying over the newline to the beginning of the new string.

Note that while there are several others ways to accomplish this exercise, you must do exactly as explained above, in particular: (i) use fgets() to read the line of input; and (ii) use strlen() to compute the length of the input line. Call your program ex1.c. Compile it and run it on a few inputs of your choice. Also, run it on the sample inputs provided and check that the output is correct.

Exercise 2
Make a copy of the program of Exercise 1, and name it ex2.c. Modify the program so that it outputs the line entered by the user in the reverse order of characters. Then, if the line is a palindrome, i.e., it reads the same forward and reverse, your program should also indicate that.

Specifically, your program should display, "Your input in reverse is:" (with newline), and the reversed input on the next line. And if the line were a palindrome, it should also print, "Found a palindrome!" (with newline).

NOTE: For this exercise, we will use a very strict definition of palindrome: A string is a palindrome if and only if it reads exactly the same backward as forward, including spaces and punctuation. Thus, for this exercise, "madam" is a palindrome, but "Madam" is not. Also, "nurses, run" is not a palindrome, but "nursesrun" is. We will use this highly restrictive definition for now just to make coding easier.

Compile and run the program on a few inputs of your choice. Also, run it on the sample inputs provided and check that the output is correct (i.e., identical to the output provided, no extra white space anywhere).

Exercise 3
Make a copy of the program of Exercise 2, and name it ex3.c. We are now going to relax the rules for what constitutes a palindrome: spaces and punctuation are to be ignored, and two letters are considered to match even if one is uppercase and the other is lowercase. As an example, the input "Race car" should now be considered a palindrome, and Nurses, run! should as well. Assume that the input will only consist of letters, spaces, punctuation, and one newline at the end.

Tip: The C library includes several functions that will be helpful here. The functions isspace() and ispunct() can tell if a character is a white space or a punctuation, respectively. The function isalpha() checks if a given character is an alphabetic letter. The functions tolower() and toupper() help convert a given character to its lowercase or uppercase equivalent, respectively. Here is a good reference for all of these functions: http://www.cplusplus.com/reference/cctype/. To use these functions, please include the following line near the top of the program, where other header files such as stdio.h are included:

	#include <ctype.h>
As in Exercise 2, your program should first display, "Your input in reverse is:", and the reversed input on the next line. And if the line were a palindrome according to the relaxed rules of this exercise, it should also print, "Found a palindrome!".

Compile and run the program on a few inputs of your choice, and also the samples provided.

Exercise 4
Write a program that reads two matrices, each of size 3x3, and prints their sum as another 3x3 matrix.

The program prompts the user with "Please enter 9 values for matrix A:\n", and then reads the values for matrix A. The first three values will correspond to row 0, next three to row 1, etc. Then the program similarly prompts the user to enter the values for matrix B. And then it prints the sum of the two matrices. The values are of int data type.

Starter code is provided in ex4.c. Please look at the sample input and output files for the exact formatting. Specifically, each value of the result matrix is printed in a field of 10 characters (study the "width" specifier for printf()). Compile and run your program on inputs of your choice. Make sure it runs correctly on the sample inputs provided. The numbers in the input are assumed to be in decimal integer format.

Reminder: As explained in Lab 2, when reading numbers separated by whitespace, the preferred method is not to put a space within the scanf format string: i.e., scanf("%d%d", ...) is preferable to scanf("%d %d", ...). This is because scanf() automatically skips over whitespace when reading numbers, so the first version will work whether there is one or more spaces, tabs, or even newlines between the numbers. The latter version, however, will expect a space between the numbers, not a tab or newline, and is thus unnecessarily over-specified.

Exercise 5
Write a program to read in a series of lines of text. As it reads each line, it prints it with these modifications: Each occurrence of 'E' or 'e' is replaced by '3'; each 'I' or 'i' is replaced by '1' (the number one); each 'O' or 'o' by '0' (the number zero); and each 'S' or 's' by '5'. When you get an empty line, the program should stop.

Your program does not need to store the entire multiline text within the program. It should simply read one line at a time, modify it, print it, and then repeat with the subsequent lines until an empty line is read.

Note: You may want to review the code for the program in Exercise 1 first.

We provided you with some starter code in ex5.c. You may assume that no input line will be larger than MAX_BUF (including the newline and the null terminator at the end). As with Exercise 1, note that fgets() still returns one character for the newline, so take this into account when terminating the do-while loop in the example code.

Here's an example scenario of running this program:

% ./ex5

The quick brown fox jumps over the lazy dog.

Th3 qu1ck br0wn f0x jump5 0v3r th3 lazy d0g.

The five boxing wizards jump quickly.

Th3 f1v3 b0x1ng w1zard5 jump qu1ckly.

<empty line>

Exercise 6
Write a function to compute n choose k, i.e., the value of the binomial coefficient nCk. Recall that this expression represents the number of ways in which one can choose k items out of a set of n items. For more on binominal coefficients, see Wikipedia article. Call your function NchooseK().

Specifically, we will implement this function using the recursive definition:

        NchooseK(n, 0) = 1
        NchooseK(n, n) = 1
        NchooseK(n, k) = NchooseK(n-1, k-1) + NchooseK(n-1, k)
You can assume that k and n are non-negative integers, and that k will never be greater than n.

Note: There is another, more common, definition of NchooseK() that is not recursive, and uses factorials. You are not supposed to implement that definition. Implement the recursive definition provided above, which only uses additions.

Now write the main() function of your program so it does the following, repeatedly: (i) reads two integers from the terminal, n and k, separated by space; (ii) calls Nchoosek() to compute the binomial coefficient; and (iii) displays the result. The program should do so repeatedly until the user enters "0 0", in which case it prints the result ("1") and terminates.

Refer to the sample inputs and outputs provided on exactly how to format your I/O. The numbers in the input are assumed to be in decimal format. Name the file with your program ex6.c. Compile and run your program on inputs of your choice, and also make sure it runs correctly on the sample inputs provided.


