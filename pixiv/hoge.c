#include <stdio.h>
#include <stdlib.h>

int main(){
  long x=12320203902093;
  char y='Y';
  int z[5]={5,10,15,20,25};

  printf("%d \n", (int)sizeof(x));
  printf("%d \n", (int)sizeof(y));
  printf("%d\n", (int)sizeof(z));

  return 0;
}
