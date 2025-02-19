#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "invert.h"

int main(int argc, char *argv[]) {
    FILE *input = stdin;
    FILE *output = stdout;

    if (argc > 1) {
        input = fopen(argv[1], "r");
        if (!input) {
            perror("Ошибка открытия входного файла");
            return 1;
        }
    }

    if (argc > 2) {
        output = fopen(argv[2], "w");
        if (!output) {
            perror("Ошибка открытия выходного файла");
            fclose(input);
            return 1;
        }
    }

    char line[MAX_LINE_LENGTH];
    while (fgets(line, MAX_LINE_LENGTH, input)) {
        size_t len = strlen(line);

        if (line[len - 1] == '\n') {
            line[len - 1] = '\0';
            len--;
        }

        reverse_line(line, len);
        fprintf(output, "%s\n", line);
    }

    if (input != stdin) fclose(input);
    if (output != stdout) fclose(output);

    return 0;
}

