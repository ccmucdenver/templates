#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <memory_in_MB> <sleep_in_sec>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Convert the input to an integer
    int mem_in_mb = atoi(argv[1]);
    if (mem_in_mb <= 0) {
        fprintf(stderr, "Please provide a positive integer for memory size.\n");
        return EXIT_FAILURE;
    }
    int sleep_sec = atoi(argv[2]);

    // Calculate the number of bytes to allocate
    size_t mem_size = (size_t)mem_in_mb * 1024 * 1024;

    // Allocate memory
    char *buffer = (char *)malloc(mem_size);
    if (buffer == NULL) {
        perror("Memory allocation failed");
        return EXIT_FAILURE;
    }
    printf("Allocated %d MB (%zu bytes) of memory.\n", mem_in_mb, mem_size);

    // Initialize the allocated memory
    memset(buffer, 0, mem_size);
    printf("Initialized the allocated memory.\n");

    // Keep the program running to observe memory usage
    printf("Sleeping for %d seconds.\n",sleep_sec);
    sleep(sleep_sec);

    // Free the allocated memory
    free(buffer);
    printf("Memory freed. Exiting.\n");

    return EXIT_SUCCESS;
}

