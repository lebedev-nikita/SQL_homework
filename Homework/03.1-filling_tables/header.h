#include <stdio.h>
#include <stdlib.h>

struct ds_t
{
	long int id;
	char * name1;
	char * name2;
	char * name3;
	char * name4;
	char * city;
};

struct dc_t
{
	long int id;
	char * name1;
	char * name2;
	char * name3;
	char * name4;
	char * manufacturer_country;	
};

struct user_t
{
	long int id;
	char * gender;
	char * city;
	int age;
};
