// introdueces floating-point numbers (doubles), and arithmetic and input/output of those numbers.
#include <stdio.h>

int main() {
	printf("Enter 10 floating-point numbers:\n");
	double num;
	double sum;
	double min;
	double max;
	double product;

	scanf("%lf", &num);
	sum = num;
	min = num;
	max = num;
	product = num;

	for (int i = 1; i < 10; i++) {
	scanf("%lf", &num);
	sum += num;
	if (num < min) {
	min = num;
	}
	if (num > max) {
	max = num;
	}
	product *= num;
	}
	printf("Sum is %.5f\n", sum);
	printf("Min is %.5f\n", min);
	printf("Max is %.5f\n", max);
	printf("Product is %.5f\n", product);

}
