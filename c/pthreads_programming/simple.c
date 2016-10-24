#include <stdio.h>

void do_one_thing(int *);
void do_another_thing(int *);
void do_wrap_up(int, int);

int r1 = 0, r2 = 0;

int main() {
  do_one_thing(&r1);
  do_another_thing(&r2);
  do_wrap_up(r1, r2);
}

void do_one_thing(int *pnum_times) {
  int i, j, x;

  for (i = 0; i < 4; i++) {
    printf("doing one thing\n");
    for (j = 0; j < 10000; j++)
      x = x + i;
    (*pnum_times)++;
  }
}

void do_another_thing(int *pnum_times) {
  int i, j, x;

  for (i = 0; i < 4; i++) {
    printf("doing another\n");
    for (j = 0; j < 10000; j++)
      x = x + i;
    (*pnum_times)++;
  }
}

void do_wrap_up(int one_times, int another_times) {
  int total;

  total = one_times + another_times;
  printf("All done, one thing %d, another %d for aa total of %d\n", one_times,
         another_times, total);
}
