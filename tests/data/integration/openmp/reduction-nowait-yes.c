// There may be race on counter between the two reductions?

#include <stdio.h>

int main() {
  const int N = 10000;
  int counter = 0;

#pragma omp parallel
  {
#pragma omp for reduction(+ : counter) nowait
    for (int i = 0; i < N; i++) {
      counter++;
    }

#pragma omp for reduction(+ : counter) nowait
    for (int i = 0; i < N; i++) {
      counter++;
    }
  }

  printf("%d\n", counter);
}