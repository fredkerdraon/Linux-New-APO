#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include "call_scilab.h"
#include "api_scilab.h"
#include "Scierror.h"
#include "BOOL.h"
#include "api_common.h"
#include "sciprint.h"

int main()
{
	// A simple SendScilabJob example

	if (SendScilabJob("disp('unfinished quote)")!=0){ // This will fail
 	printf("An error occured\n");
	}
	SendScilabJob("myMatrix=['sample','for the help']");
}
