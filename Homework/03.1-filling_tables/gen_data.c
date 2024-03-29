#define n_ds 1000
#define n_dc 1000
#define n_user 1000

#define n_in_stock 		100000
#define n_online_order 	100000
#define n_ds_review 	1000000
#define n_dc_review 	1000000
#define n_ds_adv 7
#define n_dc_adv 7

#include "header.h"

struct dc_t dc[n_dc];
struct ds_t ds[n_ds];
struct user_t user[n_user];

#include "functions.h"

void fill_online_order()
{
	FILE * out = fopen("out_online_order.sql", "w");

	long int ds_id;
	long int user_id;
	long int dc_id1, dc_id2, dc_id3, dc_id4;
	float price1, price2, price3, price4;
	int amount1, amount2, amount3, amount4;
	float total_price;

	fprintf(out, "BEGIN;\n");
	for (long int i = 0; i < n_online_order; i++)
	{
		ds_id = rand() % n_ds;
		user_id = rand() % n_user;

		dc_id1 = rand() % n_dc;
		dc_id2 = rand() % n_dc;
		dc_id3 = rand() % n_dc;
		dc_id4 = rand() % n_dc;
		price1 = ((float)(rand()%1000000))/100;
		price2 = ((float)(rand()%1000000))/100;
		price3 = ((float)(rand()%1000000))/100;
		price4 = ((float)(rand()%1000000))/100;
		amount1 = rand() % 5;
		amount2 = rand() % 5;
		amount3 = rand() % 5;
		amount4 = rand() % 5;
		total_price = price1 * amount1 + price2 * amount2 + price3 * amount3 + price4 * amount4;
		fprintf(out, "INSERT INTO online_order VALUES(%ld, %ld, %ld, ARRAY['{\"dc_id\":%ld, \"dc_name\": \"%s%s%s%s\", \"item_price\":%.2f, \"amount\":%d}'::jsonb, '{\"dc_id\":%ld, \"dc_name\": \"%s%s%s%s\", \"item_price\":%.2f, \"amount\":%d}'::jsonb, '{\"dc_id\":%ld, \"dc_name\": \"%s%s%s%s\", \"item_price\":%.2f, \"amount\":%d}'::jsonb, '{\"dc_id\":%ld, \"dc_name\": \"%s%s%s%s\", \"item_price\":%.2f, \"amount\":%d}'::jsonb], \'201%d-%d-%d\', \'201%d-%d-%d\', \'201%d-%d-%d\', %.2f );\n",
			   i, ds[ds_id].id,
			   user[user_id].id,
			   //JSON
			   dc_id1 , dc[dc_id1].name1, dc[dc_id1].name2, dc[dc_id1].name3, dc[dc_id1].name4, price1, amount1,
			   dc_id2 , dc[dc_id2].name1, dc[dc_id2].name2, dc[dc_id2].name3, dc[dc_id2].name4, price2, amount2,
			   dc_id3 , dc[dc_id3].name1, dc[dc_id3].name2, dc[dc_id3].name3, dc[dc_id3].name4, price3, amount3,
			   dc_id4 , dc[dc_id4].name1, dc[dc_id4].name2, dc[dc_id4].name3, dc[dc_id4].name4, price4, amount4,
			   //JSON
			   rand() % 10, 1 + rand() % 12, 1 + rand() % 28,
			   rand() % 10, 1 + rand() % 12, 1 + rand() % 28,
			   rand() % 10, 1 + rand() % 12, 1 + rand() % 28,
			   total_price
		);
	}
	fprintf(out, "COMMIT;\n");

	fclose(out);
}

void fill_in_stock()
{
	FILE* out = fopen("out_in_stock.sql", "w");
	long int ds_id;
	long int dc_id;

	fprintf(out, "BEGIN;\n");
	for (long int i = 0; i < n_in_stock; i++)
	{
		ds_id = rand() % n_ds;
		dc_id = rand() % n_dc;
		fprintf(out, "INSERT INTO in_stock VALUES(%ld, %ld, %.2f, %d);\n",
			    ds[ds_id].id, 
			    dc[dc_id].id, 
			    ((float)(rand() % 100000)) / 100,
			    rand() % 700
			   );
	}
	fprintf(out, "COMMIT;\n");

	fclose(out);
}

void fill_ds_review()
{
	FILE* out = fopen("out_ds_review.sql", "w");
	long int ds_id;
	long int user_id;

	fprintf(out, "BEGIN;\n");
	for (long int i = 0; i < n_ds_review; i++)
	{
		ds_id = rand() % n_ds;
		user_id = rand() % n_user;
		fprintf(out, "INSERT INTO ds_review VALUES (%ld, %ld, %ld, %.2f, \'201%d-%d-%d\', \'%s %s\', \'%s %s\');\n",
			   i, ds[ds_id].id, 
			   user[user_id].id,
			   ((float)(rand() % 500)) / 100, rand() % 10, 1 + rand() % 12, 1 + rand() % 28,
			   ds_adv[rand() % n_ds_adv], ds_adv[rand() % n_ds_adv], ds_adv[rand() % n_ds_adv], ds_adv[rand() % n_ds_adv] 
			   );
	}
	fprintf(out, "COMMIT;\n");
	
	fclose(out);
}

void fill_dc_review()
{
	FILE* out = fopen("out_dc_review.sql", "w");
	long int dc_id;
	long int user_id;

	fprintf(out, "BEGIN;\n");
	for (long int i = 0; i < n_dc_review; i++)
	{
		dc_id = rand() % n_dc;
		user_id = rand() % n_user;

		fprintf(out, "INSERT INTO dc_review VALUES (%ld, %ld, %ld, %.2f, \'201%d-%d-%d\', \'%s %s\', \'%s %s\');\n",
			   i, dc[dc_id].id, 
			   user[user_id].id,
			   ((float)(rand() % 500)) / 100, rand() % 10, 1 + rand() % 12, 1 + rand() % 28,
			   dc_adv[rand() % n_dc_adv], dc_adv[rand() % n_dc_adv], dc_adv[rand() % n_dc_adv], dc_adv[rand() % n_dc_adv] 
			   );
	}
	fprintf(out, "COMMIT;\n");
	
	fclose(out);
}

void fill_user_info()
{
	FILE* out = fopen("out_user_info.sql", "w");

	fprintf(out, "BEGIN;\n");
	for (long int i = 0; i < n_user; i++)
	{
		fprintf(out, "INSERT INTO user_info VALUES (%ld, \'%s\', %d, \'%s\', \'%ld\', \'%s%s%s@gmail.com\', \'%s%s%s\');\n",
			   i, 
			   user[i].city, 
			   user[i].age, 
			   user[i].gender,
			   user[i].phone,
			   user[i].email1,
			   user[i].email2,
			   user[i].email3,
			   user[i].address1,
			   user[i].address2,
			   user[i].address3
			   );
	}
	fprintf(out, "COMMIT;\n");
	
	fclose(out);
}

void fill_drug_store()
{
	FILE* out = fopen("out_drug_store.sql", "w");

	fprintf(out, "BEGIN;\n");
	for (long int i = 0; i < n_ds; i++)
	{
		fprintf(out, "INSERT INTO drug_store VALUES (%ld, \'%s\', \'%s%s%s%s\', \'%ld\', \'%s%s%s@gmail.com\');\n",
			   i, 
			   ds[i].city, 
			   
			   ds[i].name1, 
			   ds[i].name2, 
			   ds[i].name3, 
			   ds[i].name4,

			   ds[i].phone,

			   ds[i].email1,
			   ds[i].email2,
			   ds[i].email3
			   );
	}
	fprintf(out, "COMMIT;\n");
	
	fclose(out);
}

void fill_drug_class()
{
	FILE* out = fopen("out_drug_class.sql", "w");

	fprintf(out, "BEGIN;\n");
	for (long int i = 0; i < n_dc; i++)
	{
		fprintf(out, "INSERT INTO drug_class VALUES (%ld, \'%s%s%s%s\', \'%s\');\n",
			   i, 			   
			   dc[i].name1, 
			   dc[i].name2, 
			   dc[i].name3, 
			   dc[i].name4,
			   dc[i].manufacturer_country
			   );
	}
	fprintf(out, "COMMIT;\n");
	
	fclose(out);
}

int main() {
	fill_ds();
	fill_dc();
	fill_user();

	fill_in_stock();
	fill_ds_review();
	fill_dc_review();
	fill_online_order();
	fill_user_info();
	fill_drug_store();
	fill_drug_class();

}