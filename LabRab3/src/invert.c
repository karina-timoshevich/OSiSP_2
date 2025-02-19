#include "invert.h"
#include <string.h>

void reverse_line(char *line, int length) {
    int i = 0, j = length - 1;
    while (i < j) {
        char temp = line[i];
        line[i] = line[j];
        line[j] = temp;
        i++;
        j--;
    }
}

