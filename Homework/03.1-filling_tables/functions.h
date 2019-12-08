char* name1[10] = {"ab", "cd", "ef", "gh", "hi", 
				   "jk", "lm", "no", "pq", "rs"};

char* name2[10] = {"tu", "vw", "xy", "ac", "ce",
				   "eg", "gh", "hj", "jl", "ln"};

char* name3[10] = {"ab", "cd", "ef", "gh", "hi", 
				   "ln", "np", "pr", "rt", "tv"};

char* name4[10] = {"vx", "xa", "ae", "cg", "eh", 
				   "gj", "hl", "jn", "ue", "au"};

char* city[10] = {"Москва", "Санкт-Петербург", "Екатеринбург", "Казань", "Новосибирск",
				  "Челябинск", "Омск", "Сургут", "Новокузнецк", "Саратов"};

char* city1[10] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};
char* city2[10] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};

char* country[10] = {"Россия", "Германия", "США", "Япония", "Франция",
					 "Южная Корея", "Великобритания", "Китай", "Италия", "Испания"};

char* gender[2] = {"мужчина", "женщина"};

char* ds_adv[n_ds_adv] = {"цена", "качество", "ассортимент", "упаковка", 
						  "скорость доставки", "сервис", "вежливость"};
char* dc_adv[n_dc_adv] = {"цена", "качество", "простота", "упаковка", 
						  "вкус", "быстродействие", "эффективность"};


void fill_ds()
{
	long int j = rand();

	for (long int i = 0; i < n_ds; i++) 
	{
		ds[i].id = i;
		ds[i].name1 = name1[i % 10];
		ds[i].name2 = name2[i % 100 / 10];
		ds[i].name3 = name3[i % 1000 / 100];
		ds[i].name4 = name4[i / 1000];
		ds[i].city = city[rand() % 10];
		user[i].phone = rand() / 1000000000;
		ds[i].email1 = name1[j % 10];
		ds[i].email2 = name2[j / 10 % 10];
		ds[i].email3 = name3[j / 100 % 10];
	}
}

void fill_dc()
{
	for (long int i = 0; i < n_dc; i++) 
	{
		dc[i].id = i;
		dc[i].name1 = name1[i % 10];
		dc[i].name2 = name2[i % 100 / 10];
		dc[i].name3 = name3[i % 1000 / 100];
		dc[i].name4 = name4[i / 1000];
		dc[i].manufacturer_country = country[rand() % 10];
	}
}

void fill_user()
{
	long int j = rand();
	for (long int i = 0; i < n_user; i++) 
	{
		user[i].id = i;
		user[i].gender = gender[i&1];
		user[i].city = city[rand() % 10];
		user[i].age = 18 + rand()%64;
		user[i].phone = rand() / 1000000000;
		user[i].email1 = name1[j % 10];
		user[i].email2 = name2[j / 10 % 10];
		user[i].email3 = name3[j / 100 % 10];
	}
}
