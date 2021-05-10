// Race betwee counter write before loop and write in reduction
// See pg 319 https://www.openmp.org/wp-content/uploads/openmp-examples-5-0-1.pdf

#include <stdio.h>

int main() {
  const int N = 10000;
  int counter = 0;

#pragma omp parallel
  {
#pragma omp master
    counter = 1;

#pragma omp for reduction(+ : counter)
    for (int i = 0; i < N; i++) {
      counter++;
    }
  }

  printf("%d\n", counter);
}