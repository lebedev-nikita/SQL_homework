#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define N 10
#define n_cities 10
#define n_forms 12
#define n_countries 5
#define n_adresses (4*N)
#define n_indications 10
#define n_contraindications 10
#define n_active_ingredients 10

struct text {
    int used;
    char * text_field;
};

void struct_init(void);
void struct_free(void);
char * get_text(struct text array[], int len);
char * create_phone(void);
char * get_pseudo_enum(char * array[], int len);

// в таблицах по N id


// ! - должен быть уникальным
// # - можно сгенерировать самостоятельно
// ? - выбрать любой из списка
char * form[n_forms] = {"pills", "suspension", "powder", "paste", "aerosol", "inhaler", "nebulizer","ampulas", "skin patch", "eye drops", "ear drops", "gel"};
char * city[n_cities] = {"Moscow", "Saint Petersburg", "Ekaterinburg", "Novokuznetsk", "Perm", "Novosibirsk", "Belgorod", "Magnitogorsk", "London", "New York"};
char * country[n_countries] = {"Russia", "Sweden", "Ukraine", "USA", "England"};
char * indications[n_indications] = {"hypovitaminosis", "local pain", "sensitive teeth", "any illness", "cough, sore throat", "liver problems", "eye dryness", "pain in leg", "headache", "blindness"};
char * contraindications[n_contraindications] = {"individual intolerance", "hypersensitivity", "sensitive teeth", "no", "bipolar disorder", "liver problems", "low arterial pressure", "bad mood", "headache", "obessity"};
char * active_ingredients[n_active_ingredients] = {"vitamins A, B, C", "Hydrochloride", "sorbitol, PEG-6", "Hydrated Silica", "Tetrapotassium Pyrophosphate", "mustard", "paracetamol", "fenilefrin", "feniramin", "natural vitamins"};
struct text address[3*N]; // !

// struct text ds_id[N]; // 0..9    V
struct text ds_name[N]; // !        V
struct text ds_email[N]; // !       V
// struct text ds_phone[N]; // #    V
struct text ds_city[N]; // ?        V


// struct text man_id[N]; // 0..9   V
struct text man_name[N]; // !       V
struct text man_email[N]; // !      V
// struct text man_phone[N]; // #   V
struct text man_city[N]; // ?       V
struct text man_address[N]; // !    V


// struct text dc_id[N]; // 0..9
struct text dc_name[N]; // !
struct text dc_form[N]; // ?
// struct text dc_man_id[N]; // #
// struct text dc_amount_in_package[N]; // #
struct text dc_indications[N];  // ?
struct text dc_contraindications[N]; // ?
struct text dc_active_ingredients[N]; // ?
// struct text dc_shelf_life[N]; // #

struct text prov_name[N]; // !
struct text prov_email[N]; // !
// struct text prov_phone[N]; // #
struct text prov_city[N]; // ?
struct text prov_address[N]; // !


void struct_init(void)
{
    // N = 10 

    for (int i = 0; i < N; ++i) {
        ds_name[i].used = 0;
        ds_email[i].used = 0;
        man_name[i].used = 0;
        man_email[i].used = 0;
        dc_name[i].used = 0;
        prov_name[i].used = 0;
        prov_email[i].used = 0;
        ds_name[i].text_field = malloc(50 * sizeof(char*));
        ds_email[i].text_field = malloc(50 * sizeof(char*));
        man_name[i].text_field = malloc(50 * sizeof(char*));
        man_email[i].text_field = malloc(50 * sizeof(char*));
        dc_name[i].text_field = malloc(50 * sizeof(char*));
        prov_name[i].text_field = malloc(50 * sizeof(char*));
        prov_email[i].text_field = malloc(50 * sizeof(char*));
    }
    for (int i = 0; i < n_adresses; ++i) {
        address[i].used = 0;
        address[i].text_field = malloc(50 * sizeof(char*));
    }

    strcpy(ds_name[0].text_field, "zdorovye");
    strcpy(ds_name[1].text_field, "bodrost365");
    strcpy(ds_name[2].text_field, "happiness");
    strcpy(ds_name[3].text_field, "stay alive");
    strcpy(ds_name[4].text_field, "apteka");
    strcpy(ds_name[5].text_field, "pills for you");
    strcpy(ds_name[6].text_field, "Lubavushka");
    strcpy(ds_name[7].text_field, "bodrost");
    strcpy(ds_name[8].text_field, "happy");
    strcpy(ds_name[9].text_field, "jivika");

    strcpy(ds_email[0].text_field, "zdorovye@gmail.com");
    strcpy(ds_email[1].text_field, "bodrost365@gmail.com");
    strcpy(ds_email[2].text_field, "happiness@gmail.com");
    strcpy(ds_email[3].text_field, "stay_alive@gmail.com");
    strcpy(ds_email[4].text_field, "apteka@yandex.ru");
    strcpy(ds_email[5].text_field, "pills_for_you@mail.ru");
    strcpy(ds_email[6].text_field, "Lubavushka@yandex.ru");
    strcpy(ds_email[7].text_field, "bodrost@mail.ru");
    strcpy(ds_email[8].text_field, "happiness@yandex.ru");
    strcpy(ds_email[9].text_field, "jivika@gmail.com");

    strcpy(address[0].text_field, "Lomonosovsky pr-t, 27/11");
    strcpy(address[1].text_field, "Vernadskogo pr-t, 12");
    strcpy(address[2].text_field, "Red Square, 33");
    strcpy(address[3].text_field, "Vernadskogo pr-t, 11");
    strcpy(address[4].text_field, "Lenina, 17");
    strcpy(address[5].text_field, "Zeleniy per, 19");
    strcpy(address[6].text_field, "Severnaya, 12");
    strcpy(address[7].text_field, "Yuzhnaya, 32");
    strcpy(address[8].text_field, "Nevsky pr-t, 12");
    strcpy(address[9].text_field, "Vaynera, 2");

    strcpy(address[10].text_field, "17-th avenue, 84");
    strcpy(address[11].text_field, "Baker street, 221b");
    strcpy(address[12].text_field, "Lenina,3");
    strcpy(address[13].text_field, "Bunina, 12b");
    strcpy(address[14].text_field, "Pochtovaya, 21");
    strcpy(address[15].text_field, "Midborg, 12");
    strcpy(address[16].text_field, "Vinogradnaya, 88");
    strcpy(address[17].text_field, "Jidkaya, 67");
    strcpy(address[18].text_field, "Holmistaya, 56");
    strcpy(address[19].text_field, "Kirpichnaya, 56");

    strcpy(address[20].text_field, "Abrikosovaya, 71");
    strcpy(address[21].text_field, "Novogodnyaya, 31");
    strcpy(address[22].text_field, "Vecheryaya, 22");
    strcpy(address[23].text_field, "Ushnaya, 2");
    strcpy(address[24].text_field, "Peshekhodnaya, 11");
    strcpy(address[25].text_field, "High st., 14");
    strcpy(address[26].text_field, "Southern st. 13");
    strcpy(address[27].text_field, "Ulochnaya, 7");
    strcpy(address[28].text_field, "Bazhova, 3");
    strcpy(address[29].text_field, "Bronzovaya, 90");

    strcpy(address[30].text_field, "Nosovaya, 71");
    strcpy(address[31].text_field, "Nogovaya, 31");
    strcpy(address[32].text_field, "Ruchnaya, 22");
    strcpy(address[33].text_field, "Rechnaya, 2");
    strcpy(address[34].text_field, "Tugoumova, 11");
    strcpy(address[35].text_field, "Parkovaya, 14");
    strcpy(address[36].text_field, "Troynaya, 13");
    strcpy(address[37].text_field, "Vstrechnaya, 7");
    strcpy(address[38].text_field, "Lobovaya, 3");
    strcpy(address[39].text_field, "Silver st. 90");

    strcpy(man_name[0].text_field, "Bayer");
    strcpy(man_name[1].text_field, "Unifarm");
    strcpy(man_name[2].text_field, "CMC");
    strcpy(man_name[3].text_field, "OneFarm");
    strcpy(man_name[4].text_field, "NaturalPills");
    strcpy(man_name[5].text_field, "rosgosfarm");
    strcpy(man_name[6].text_field, "medicine");
    strcpy(man_name[7].text_field, "Health Products");
    strcpy(man_name[8].text_field, "Walmart");
    strcpy(man_name[9].text_field, "Dr. EyeBolit");

    strcpy(man_email[0].text_field, "bayer@gmail.com");
    strcpy(man_email[1].text_field, "unifarm@gmail.com");
    strcpy(man_email[2].text_field, "tenger_cavalry@yandex.ru");
    strcpy(man_email[3].text_field, "onefarm@yandex.ru");
    strcpy(man_email[4].text_field, "naturalPills@mail.ru");
    strcpy(man_email[5].text_field, "rosgosfarm@yandex.ru");
    strcpy(man_email[6].text_field, "medicine@gmail.com");
    strcpy(man_email[7].text_field, "health@gmail.com");
    strcpy(man_email[8].text_field, "eyebolit@gmail.com");
    strcpy(man_email[9].text_field, "health_products@yandex.ru");

    strcpy(dc_name[0].text_field, "Komplivit vitamins");
    strcpy(dc_name[1].text_field, "Blend-a-med");
    strcpy(dc_name[2].text_field, "Novokain");
    strcpy(dc_name[3].text_field, "mustard plaster");
    strcpy(dc_name[4].text_field, "Tera-flu");
    strcpy(dc_name[5].text_field, "Heptral");
    strcpy(dc_name[6].text_field, "Nauralica");
    strcpy(dc_name[7].text_field, "Vitrum Memory");
    strcpy(dc_name[8].text_field, "Fastum");
    strcpy(dc_name[9].text_field, "Aphobazol");

    strcpy(prov_name[0].text_field, "medstock1");
    strcpy(prov_name[1].text_field, "medstock2");
    strcpy(prov_name[2].text_field, "medsklad");
    strcpy(prov_name[3].text_field, "drugprov");
    strcpy(prov_name[4].text_field, "ip ivanov ivan ivanich");
    strcpy(prov_name[5].text_field, "delivery sklad");
    strcpy(prov_name[6].text_field, "med_delivery");
    strcpy(prov_name[7].text_field, "ooo med_tov_sell");
    strcpy(prov_name[8].text_field, "med_provisioner");
    strcpy(prov_name[9].text_field, "BestProv");

    strcpy(prov_email[0].text_field, "medstock1@gmial.com");
    strcpy(prov_email[1].text_field, "medstock2@gmial.com");
    strcpy(prov_email[2].text_field, "medsklad@gmial.com");
    strcpy(prov_email[3].text_field, "drugprov@gmial.com");
    strcpy(prov_email[4].text_field, "ip ivanov ivan ivanich@gmial.com");
    strcpy(prov_email[5].text_field, "delivery sklad@gmial.com");
    strcpy(prov_email[6].text_field, "med_delivery@gmial.com");
    strcpy(prov_email[7].text_field, "ooo med_tov_sell@gmial.com");
    strcpy(prov_email[8].text_field, "med_provisioner@gmial.com");
    strcpy(prov_email[9].text_field, "BestProv@gmial.com");

    return;
}

// struct text sc_drug_store_id[N]; // #
// struct text sc_drug_class_id[N]; // #
// struct text sc_provisioner_id[N]; // #
// struct text sc_price[N]; // #
// struct text sc_current_amount[N]; // #
// struct text sc_recommended_amount[N]; // #
// struct text sc_request_date[N]; // NULL
// struct text sc_time_to_deliver[N]; // #



int main() 
{
    srand( (unsigned int) time(NULL) );
    struct_init();

    for (int i = 0; i < N;  ++i) { // drug_store
        char * phone = create_phone();
        printf("INSERT INTO drug_store VALUES (%d, '%s', '%s', '%s', '%s', '%s');\n", 
                i+1, get_text(ds_name, N), get_text(ds_email, N), phone, get_pseudo_enum(city, n_cities), get_text(address, n_adresses) );
        free(phone);
    }

    printf("\n\n");

    for (int i = 0; i < N;  ++i) { // manufacturer
        char * phone = create_phone();
        printf("INSERT INTO manufacturer VALUES (%d, '%s', '%s', '%s', '%s', '%s', '%s');\n", 
                i+1, get_text(man_name, N), get_text(man_email, N), phone, get_pseudo_enum(country, n_countries), get_pseudo_enum(city, n_cities), get_text(address, n_adresses) );
        free(phone);   
    }

    printf("\n\n");

    for (int i = 0; i < N;  ++i) { // drug_class
        printf("INSERT INTO drug_class VALUES (%d, '%s', '%s', '%d', '%d', '%s', '%s', '%s', '%d days');\n", 
                i+1, get_text(dc_name, N), get_pseudo_enum(form, n_forms), rand() % N, (rand() % 20 + 1) * 10, 
                get_pseudo_enum(indications, n_indications), get_pseudo_enum(contraindications, n_contraindications), get_pseudo_enum(active_ingredients, n_active_ingredients), rand() % (365) * 10 );
    }

    printf("\n\n");

    for (int i = 0; i < N;  ++i) { // provisioner
        char * phone = create_phone();
        printf("INSERT INTO manufacturer VALUES (%d, '%s', '%s', '%s', '%s', '%s');\n", 
                i+1, get_text(prov_name, N), get_text(prov_email, N), phone, get_pseudo_enum(city, n_cities), get_text(address, n_adresses) );
        free(phone);   
    }



    struct_free();
    return 0;
}

char * get_pseudo_enum(char * array[], int len)
{
    return array[rand() % n_cities];
}


char * create_phone(void)
{
    char * phone = malloc(15 * sizeof(char));
    sprintf(phone, "%d-%d-%d", rand() % 1000, rand() % 100, rand() % 100);

    return phone;
}


char * get_text(struct text array[], int len)
{
    int j = rand() % len;

    while (array[j].used != 0) 
        j = rand() % len;

    array[j].used = 1;
    return array[j].text_field;
}

void struct_free(void) 
{
    for (int i = 0; i < N; ++i) {
        free(ds_name[i].text_field);
        free(ds_email[i].text_field);
        free(man_name[i].text_field);
        free(man_email[i].text_field);
        free(dc_name[i].text_field);
        free(prov_name[i].text_field);
        free(prov_email[i].text_field);
    }
    for (int i = 0; i < n_adresses; ++i) {
        free(address[i].text_field);
    }
}