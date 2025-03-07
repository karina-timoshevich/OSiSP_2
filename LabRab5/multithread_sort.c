#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>

typedef struct {
    int* array;
    int start;
    int end;
} ThreadData;

int compare(const void* a, const void* b) {
    return (*(int*)a - *(int*)b);
}

void* thread_sort(void* arg) {
    ThreadData* data = (ThreadData*)arg;
    qsort(data->array + data->start, data->end - data->start, sizeof(int), compare);
    printf("Поток отсортировал часть массива от %d до %d\n", data->start, data->end - 1);
    pthread_exit(NULL);
}

void merge(int* array, int start1, int end1, int start2, int end2) {
    int i = start1, j = start2, k = 0;
    int* temp = (int*)malloc((end1 - start1 + end2 - start2) * sizeof(int));

    while (i < end1 && j < end2) {
        if (array[i] < array[j]) {
            temp[k++] = array[i++];
        } else {
            temp[k++] = array[j++];
        }
    }

    while (i < end1) {
        temp[k++] = array[i++];
    }

    while (j < end2) {
        temp[k++] = array[j++];
    }

    for (i = start1, j = 0; i < end2; i++, j++) {
        array[i] = temp[j];
    }

    free(temp);
}

int main() {
    int n, num_threads;
    printf("Введите размер массива: ");
    scanf("%d", &n);
    printf("Введите количество потоков: ");
    scanf("%d", &num_threads);

    if (num_threads <= 0 || num_threads > n) {
        printf("Некорректное количество потоков.\n");
        return 1;
    }

    int* array = (int*)malloc(n * sizeof(int));
    srand(time(NULL));
    for (int i = 0; i < n; i++) {
        array[i] = rand() % 1000; 
    }

    printf("Исходный массив:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    pthread_t* threads = (pthread_t*)malloc(num_threads * sizeof(pthread_t));
    ThreadData* thread_data = (ThreadData*)malloc(num_threads * sizeof(ThreadData));

    int part_size = n / num_threads;
    for (int i = 0; i < num_threads; i++) {
        thread_data[i].array = array;
        thread_data[i].start = i * part_size;
        thread_data[i].end = (i == num_threads - 1) ? n : (i + 1) * part_size;
        pthread_create(&threads[i], NULL, thread_sort, &thread_data[i]);
    }

    for (int i = 0; i < num_threads; i++) {
        pthread_join(threads[i], NULL);
    }

    for (int i = 1; i < num_threads; i++) {
        merge(array, 0, i * part_size, i * part_size, (i + 1) * part_size);
    }

    printf("Отсортированный массив:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    free(array);
    free(threads);
    free(thread_data);

    return 0;
}
