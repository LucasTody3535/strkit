#include <stdio.h>
#include <stdlib.h>

void assert_numbers(int expected, int actual, const char* test_name) {
	printf(test_name);
	if(expected != actual) {
		printf(": Failed");
		fprintf(stderr, "\n   Expected: %d, Received: %d\n", expected, actual);
		exit(1);
	}
	printf(": Passed\n");
}
