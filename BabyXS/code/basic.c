#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

int meaning () { return 42 }
void greet (char* name) 
{
  printf( "Hello %s\n", name ) 
}

MODULE = My::Module    PACKAGE = My::Module

int
meaning ()

void
greet (name)
    char* name
