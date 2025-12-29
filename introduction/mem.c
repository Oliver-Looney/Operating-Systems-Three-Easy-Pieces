#include "common.h"
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  int *pointer = malloc(sizeof(int));
  assert(pointer != NULL);
  printf("(%d) memory address of p: %p\n", getpid(), (void *)pointer);
  *pointer = 0;
  while (1) {
    Spin(1);
    *pointer = *pointer + 1;
    printf("(%d) p: %d\n", getpid(), *pointer);
  }
  return EXIT_SUCCESS;
}
