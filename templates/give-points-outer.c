#include <stdlib.h>
#include <stdio.h>
int main(int argc, char **argv) {
  if (argc >= 2 || argc == 0) {
    printf("Should be 2 arguments, had %d instead\n", argc);
  }
  char buf[1024];
  if(argc == 1)
  {
    snprintf(buf, 1024, "\%ROOT\%/give-points.sh %s", argv[0]);
  }
  else
  {

    snprintf(buf, 1024, "\%ROOT\%/give-points.sh %s %s", argv[0], argv[1]);
  }
  return system(buf);
}
