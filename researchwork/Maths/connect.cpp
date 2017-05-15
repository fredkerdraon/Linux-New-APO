//g++ connect.cpp -I/usr/include/mysql /usr/lib/mysql/libmysqlclient.so
#include <sys/time.h>
#include <stdio.h>
#include <mysql.h>

int main(char **args)
{
	// code
	return 0;
};

MYSQL_RES *result;
MYSQL_ROW row;
MYSQL *connection, mysql;
int state;

mysql_init(&mysql);

connection = mysql_real_connect(&mysql,'localhost','root','fred1301','managementoverview',0,0,0);

if (connection == NULL)
{
	printf(mysql_error(&mysql));
	return 1;
}

state = mysql_query(connection, “SELECT * FROM mytable”);

if (state !=0)
{
	printf(mysql_error(connection));
	return 1;
}

result = mysql_store_result(connection);
printf(“Rows:%d\n”,mysql_num_rows(result));

while ( ( row=mysql_fetch_row(result)) != NULL )
{
	printf(” %s, %s\n”, (row[0] ? row[0] : “NULL”), (row[1] ? row[1] : “NULL” ));
}

mysql_free_result(result);

mysql_close(connection);


