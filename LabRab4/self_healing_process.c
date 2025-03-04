#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <time.h>

volatile sig_atomic_t keep_running = 1; 

void handle_signal(int sig) {
    if (sig == SIGTERM || sig == SIGINT) {
        printf("Получен сигнал %d. Создание копии процесса...\n", sig);

        pid_t pid = fork(); 
        if (pid < 0) {
            perror("Ошибка при создании копии процесса");
            exit(EXIT_FAILURE);
        } else if (pid == 0) {
            printf("Дочерний процесс продолжает работу.\n");
            keep_running = 1; 
        } else {
            printf("Родительский процесс завершен.\n");
            exit(EXIT_SUCCESS);
        }
    }
}

int main() {
    signal(SIGTERM, handle_signal);
    signal(SIGINT, handle_signal);

    int counter = 0; 
    time_t start_time = time(NULL); 

    while (keep_running) {
        printf("Счетчик: %d\n", counter++);
        sleep(1); 
        if (time(NULL) - start_time > 10) {
            printf("Время работы истекло. Завершаю процесс.\n");
            keep_running = 0;
        }
    }

    printf("Процесс завершен.\n");
    return 0;
}
