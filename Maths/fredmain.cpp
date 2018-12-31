//To compile this we need: g++ -Wall -Wl,--no-as-needed -o simple_call_scilab.exe $(pkg-config --libs --cflags scilab) $(ls /usr/lib/scilab/ | sed 's/^lib/-l/g' | sed "s/\.so.*$//g" | sort | uniq | grep -v disable) simple_call_scilab.c

//-lsciaction_binding -lsciarnoldi -lscicall_scilab -lscicommons -lscicompletion -lsciconsole -lsciconsole-minimal -lsciexternal_objects -lsciexternal_objects_java -lscifunctions -lscigraphic_export -lscigraphic_objects -lscigraphics -lscigui -lscihdf5 -lscihelptools -lscihistory_browser -lscihistory_manager -lsciinterpolation -lscijvm -lscilab -lscilab-cli -lscilocalization -lscimatio -lscioptimization -lsciparallel -lscipreferences -lscipreferences-cli -lscirandlib -lscirenderer -lsciscicos -lsciscicos_blocks -lsciscicos_blocks-cli -lsciscicos-cli -lsciscinotes -lscisignal_processing -lscisound -lscispecial_functions -lscispreadsheet -lscistatistics -lscisundials -lscisymbolic -lscitclsci -lscitypes -lsciui_data -lsciumfpack -lscixcos -lscixml

#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <stdlib.h>
#include "call_scilab.h"
#include "api_scilab.h"
#include "Scierror.h"
#include "BOOL.h"
#include "api_common.h"
#include "sciprint.h"
#include "string.h"

//#include "my_global.h" // Include this file first to avoid problems
#include "mysql.h" // MySQL Include File
#define SERVER "localhost"
#define USER "username"
#define PASSWORD "password"
#define DATABASE "databasename"


using namespace std;

int main( int argc, char* argv[])
{
	setenv("START","/usr/share/scilab/etc/scilab.start",1);
	setenv("SCI","/usr/share/scilab",1);
	float favNum = 3.1415926535;
	double doublefavNum = 3.1415926535;
	cout << "Double favorite Num: " << doublefavNum << endl;
	cout << "Favorite Num: " << favNum << endl;

	cout << "Size of double: " << sizeof(doublefavNum) << endl;
	cout << "Size of float: " << sizeof(favNum) << endl;
	cout << "Parameter:" << argv[1] << endl;
	
	/****** INITIALIZATION **********/
	#ifdef _MSC_VER
	if ( StartScilab(NULL,NULL,NULL) == FALSE )
	#else
	if ( StartScilab(getenv("SCI"),getenv("START"),NULL) == FALSE )
	#endif
  	{
 		fprintf(stderr,"Error while calling StartScilab\n");
		return -1;
 	}

	SciErr sciErr;

	printf("Connection to the database...\n");

 	MYSQL *connect; // Create a pointer to the MySQL instance
 	connect=mysql_init(NULL); // Initialise the instance
 	/* This If is irrelevant and you don't need to show it. I kept it in for Fault Testing.*/
    	if(!connect)    /* If instance didn't initialize say so and exit with fault.*/
    	{
        	fprintf(stderr,"MySQL Initialization Failed");
        	return 1;
    	}
    	/* Now we will actually connect to the specific database.*/

    	connect=mysql_real_connect(connect,"localhost","root","fred1301","managementoverview",0,NULL,0);
    	/* Following if statements are unneeded too, but it's worth it to show on your
    	first app, so that if your database is empty or the query didn't return anything it
    	will at least let you know that the connection to the mysql server was established. */

    	if(connect)
	{
        	printf("Connection Succeeded\n");
    	}
    	else
	{
        	printf("Connection Failed!\n");
    	}
	
	printf("\n");
	printf("Running the query...\n");

	unsigned int numrows;	
	if(strcmp(argv[1],"cashflows") == 0)
	{
			printf("Second param: %s\n",argv[2]);				
			printf("Third param: %s\n",argv[3]);				

			MYSQL_RES *res_set; /* Create a pointer to recieve the return value.*/
    			MYSQL_ROW row;  /* Assign variable for rows. */
			string query;
			query = "SELECT * FROM cashflows WHERE Debit > 300 and MyDate between "; 
			query.append("'");
			query.append(argv[2]);
			query.append("' AND '");
			query.append(argv[3]);
			query.append("'");
			printf("%s \n",query.c_str());
    			mysql_query(connect,query.c_str());
    			/* Send a query to the database. */
    			unsigned int i = 0; /* Create a counter for the rows */

    			res_set = mysql_store_result(connect); /* Receive the result and store it in res_set */

    			numrows = mysql_num_rows(res_set); /* Create the count to print all rows */

			int a = 0;
			double Vector[numrows];

    			/*This while is to print all rows and not just the first row found, */
    			while ((row = mysql_fetch_row(res_set)) != NULL)
			{
				Vector[a] = atof(row[3]);
				a++;
    			}
        		int rowVector = numrows, colVector = 1; /* Size of the matrix */
        		char variableNameVector[] = "Vector";

        		/*
         		* Write it into Scilab's memory 
         		*/
        		sciErr = createNamedMatrixOfDouble(scilabEnv(),variableNameVector,rowVector,colVector, Vector); /* pvApiCtx is a global variable */
			printf("On a cree la matrice\n");
        		if(sciErr.iErr)
        		{
            			printError(&sciErr, 0);
        		}
        	/*
         * Prior to Scilab 5.2:
         * C2F(cwritemat)(variableNameB, &rowB, &colB, B, strlen(variableNameB));
        */

        printf("Display from Scilab of Vector:\n");
  	SendScilabJob("plot(Vector)");
  	SendScilabJob("plot(Vector)");
	SendScilabJob("plot(x,5000)");
	SendScilabJob("legend(['Histogramme des cashflows']");
	SendScilabJob("xtitle('Spot EUR/GBP')");
	SendScilabJob("f=get('current_figure')");
	SendScilabJob("f.figure_size=[700,400]");
	SendScilabJob("xs2png(0,'Vector.png');");
	/****** TERMINATION **********/
    	}
	
	printf("On referme la connection...\n");
    	mysql_close(connect);   /* Close and shutdown */


	if ( TerminateScilab(NULL) == FALSE ) 
	{
  		fprintf(stderr,"Error while calling TerminateScilab\n");
		return -2;
	}

    	return 0;
}
