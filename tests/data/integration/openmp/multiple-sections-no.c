#include <stdio.h>

int main()
{
  int x=0;
  int y=0;

#pragma omp parallel sections
  {
#pragma omp section
    x = 1;
#pragma omp section
    y = 2;
  }

#pragma omp parallel sections
  {
#pragma omp section
    x++;
#pragma omp section
    y++;
  }

  printf("x=%d, y=%d\n", x, y);
  return 0;
} 