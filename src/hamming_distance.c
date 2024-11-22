#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "status_codes.h"

int hamdis(const char* first_text, const char* second_text) {
    if(first_text == NULL || second_text == NULL) return NULL_POINTER;

    size_t counter = 0;
    size_t first_text_length = strlen(first_text);
    size_t second_text_length = strlen(second_text);

    if(first_text_length != second_text_length) return STRINGS_WITH_DIFFERENT_LENGTH;

    for(size_t i = 0; i < first_text_length; i++)
        if(first_text[i] != second_text[i]) counter++;

    return counter == 0 ? EQUALS : NOT_EQUALS;
}
