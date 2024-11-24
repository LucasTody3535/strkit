#include <stdio.h>

#include "assert.h"
#include "hamdis.h"
#include "status_codes.h"

void hamming_distance_tests() {
    char* first_text = "John Doe";
    char* second_text = "Jane Doe";

	printf(" Hamming Distance tests\n");
    printf(" Values used: %s, %s\n", first_text, second_text);
	assert_numbers(EQUALS, hamdis(first_text, first_text), "  Expected to be equals");
	assert_numbers(NOT_EQUALS, hamdis(first_text, second_text), "  Expected to be not equals");
	assert_numbers(NULL_POINTER, hamdis(NULL, second_text), "  Expected first param to be NULL");
	assert_numbers(NULL_POINTER, hamdis(first_text, NULL), "  Expected second param to be NULL");
	printf(" Hamming Distance related tests ended\n");
}

int main() {
    hamming_distance_tests();
}
