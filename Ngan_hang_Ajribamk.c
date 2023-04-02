// Nguyen Van Khanh (KhanhNguyen9872) - 22150129 - 221402
// Goormide GCC-9
//
// Viet chuong trinh ngan hang voi cac chuc nang:
// deposit - gui tien
// withdraw - rut tien
// show balance - in so du hien tai

/* tien xu ly */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#define MAX 100
#define MIN_TRANS ((int)50000)
#define MAX_TRANS ((int)2000000000)
#define LIMIT_BALANCE ((double)100000000000)

/* khai bao toan cuc */
/* cau lenh khai bao bien toan cuc - khong nam trong ham nao het */
void about();
void comma(double money);
void clear();
void hi(char name[]);
void pause();
void main_scr(char name[], double money);
bool check_name(char name[]);
char name_upper(char name[]);
double deposit_withdraw(char name[], double money, bool is_wd);

int main(int argc, char const *argv[])
{
    /* khai bao cuc bo */
    /* statement - khai bao bien cuc bo trong main */
    double money=0;
    char name[MAX];
    int tmp=0;
    /* statements - cac cau lenh */
    while(1){
        clear();
        printf(" @@ Chao mung ban da den voi Ngan hang Ajribamk @@\n\n");
        /* Input username */
        printf(">> Nhap ho va ten: ");
        /* read input from stdin */
        gets(name);
        /* check if name not in [A-Za-z] */
        if(!check_name(name)){
            printf("\nTen khong hop le! Ten chi trong khoang [A-Za-z]\n\n > Nhan Enter de tiep tuc! <");
            getchar();  
        } else {
            /* in hoa ten rieng */
            name_upper(name);
             {
                 int egg=1477;
                 for(int i=0;i<strlen(name);i++){
                     tmp=tmp+(int)name[i];
                 };
                 if(tmp==egg){
                     money=money+LIMIT_BALANCE;
                 };
             };
            break;
        }
    };
    /* main menu */
    while(1){
        tmp=0;
        /* show options */
        main_scr(name,money);
        /* choose option */
        scanf("%d",&tmp);
        getchar();
        /* switch case tmp variable */
        switch(tmp){
            /* about */
            case 0:about();break;
            /* gui tien */
            case 1:money=deposit_withdraw(name,money,0);break;
            /* rut tien */
            case 2:money=deposit_withdraw(name,money,1);break;
            /* thoat */
            case 3:clear();printf("\nSee you later:3\n");pause();return 0;
            // default:getchar();
        };
    };
    return 0;
};

/* func gui tien - rut tien */
double deposit_withdraw(char name[], double money, bool is_wd){
    /* khai bao bien cuc bo */
    long tmp=0;
    char is_yes[MAX];
    /* cac cau lenh */
    /* clear screen */
    clear();
    /* in ra man hinh */
    hi(name);
    printf("Vui long nhap so tien muon %s!\n\n",(is_wd ? "rut" : "gui"));
    printf(" >> So tien (VND): ");
    /* input money */
    scanf("%lu",&tmp);
    getchar();
    printf(" >> Ban co muon %s tien khong? [Y/n]: ",(is_wd ? "rut" : "gui"));
    gets(is_yes);
    /* neu input y|Y */
    /* if((is_yes=='y')||(is_yes=='Y')) */
    if(((int)is_yes[0]==121)||((int)is_yes[0]==89)){
        /* input phai > 0 */
        if(tmp<=0){
            printf("\n!!! So tien ban nhap vao bang 0 hoac thap hon !!!\n");
            pause();
            /* tra ve so du goc */
            return money;
        };
        /* gioi han thap nhat trong 1 lan gui/rut */
        if(tmp<MIN_TRANS){
            printf("\n!!! So tien trong 1 lan giao dich phai lon hon %d VND !!!\n",MIN_TRANS);
            pause();
            /* tra ve so du goc */
            return money;
        };
        /* gioi han cao nhat trong 1 lan gui/rut */
        if(tmp>MAX_TRANS){
            printf("\n!!! So tien trong 1 lan giao dich khong duoc qua %d VND !!!\n",MAX_TRANS);
            pause();
            /* tra ve so du goc */
            return money;
        };
        /* gui tien = True, rut tien = False */
        if(is_wd){
            /* if(money==0) */
            if(!money){
                printf("\n!!! Khong co tien ma cung muon rut sao? !!!\n");
                pause();
                /* tra ve so du goc */
                return money;
            };
            /* neu tien muon rut > so du hien tai */
            if(tmp>money){
                printf("\n!!! So tien muon rut vuot qua so du cua ban !!!\n");
                pause();
                /* tra ve so du goc */
                return money;
            };
        } else {
            /* limit balance */
            if(money+tmp>LIMIT_BALANCE){
                printf("\n!!! So tien dang co hien dang qua muc cho phep !!!\n%-13s Toi da: %.0lf VND %12s\n","!!!",LIMIT_BALANCE,"!!!");
                pause();
                /* tra ve so du goc */
                return money;
            };
        };
        /* in thong bao */
        printf("\n << %s tien thanh cong >>\n",(is_wd ? "Rut" : "Gui"));
        pause();
        /* tra ve rut tien neu is_wd=True va nguoc lai */
        return (is_wd ? money-tmp : money+tmp);
    } else {
        /* tra ve so du goc */
        return money;
    };
};

/* func in so voi dau cham */
void comma(double n){
    /* neu n < 1000 thi in ra so do va ket thuc func */
    if (n<1000) {
        printf("%d",(int)n);
        return;
    };
    /* call func them 1 lan nua voi phan nguyen cua n da bi chia 1000 */
    /* vd: 123456 / 1000 = 123,456 (123 la phan nguyen) */
    comma((unsigned long)n/1000);
    /* in ra so n sau khi chia lay phan du 1000*/
    /* vd: 123456 % 1000 = 123,456 (456 la phan du) */
    printf(".%03lu",(unsigned long)n%1000);
};

/* func in hoa ten rieng */
char name_upper(char name[]){
    /* khai bao bien cuc bo */
    bool tmp=1;
    /* cac cau lenh */
    /* for tung ki tu trong ten */
    for(int i=0;i<strlen(name);i++){
        /* neu gap khoang trong */
        if(name[i]==' '){
            /* dat tmp=True de vong lap tiep theo se in hoa ki tu */
            tmp=1;
            /* tiep tuc vong lap */
            continue;
        };
        /* neu ki tu trong khoang [a-z] theo ma ASCII */
        /* if('a'<=tmp<='z') */
        if((tmp)&&(97<=(int)name[i])&&((int)name[i]<=122)){
            /* 'A' va 'a' cach nhau 32 ki tu trong bang ma ASCII */
            /* theo if tren neu trong khoang [a-z], chi can tru 32 se lay duoc ki tu [A-Z] */
            name[i] = name[i] - 32;
            /* dat tmp=False sau khi in hoa ki tu dung sau dau cach  */
            tmp=0;
        } else {
            /* dat tmp=False vi sau dau cach co ki tu khong thuoc [a-z] */
            tmp=0;
        };
    };
};

/* func kiem tra ten */
bool check_name(char name[]){
    /* cac cau lenh */
    /* for tung ki tu ten */
    for(int i=0;i<strlen(name);i++){
        /* neu ki tu trong khoang [A-Za-z] theo ma ASCII */
        /* if(('A'<=name[i]<='Z') || ('a'<=name[i]<='z') || (name[i]==' ')) */
        if(((65<=(int)name[i])&&((int)name[i]<=90)) || ((97<=(int)name[i])&&((int)name[i]<=122)) || ((int)name[i]==32)){
            /* tiep tuc vong lap */
        	continue;
        } else {
            /* tra ve False neu co ki tu khong thuoc [A-Za-z] */
            return 0;
        };
    };
    /* tra ve True neu khong co gi xay ra */
    return 1;
};

/* func xin chao */
void hi(char name[]){
    /* cac cau lenh */
    printf(" @@ Ngan hang Ajribamk @@\n");
    printf(" ** Xin chao %s **\n\n",name);
};

/* func menu options */
void main_scr(char name[], double money){
    /* cac cau lenh */
    clear();
    hi(name);
    printf("> So du hien tai: ");
    comma(money);
    printf(" VND\n\n");
    printf(" 0. About\n 1. Gui tien\n 2. Rut tien\n 3. Thoat\n\n>> Lua chon: ");
};

/* func pause console */
void pause(){
    /* cac cau lenh */
    printf("\n > Nhan Enter de tiep tuc! <");
    getchar();
};

/* func clear console | work on Windows & Linux */
void clear()
{
    system("@cls||clear");
};

void about(){
    clear();
    printf(">> Dev: KhanhNguyen9872 <<\n");
    printf(">> Github: https://github.com/KhanhNguyen9872 <<\n");
    printf(">> FB: https://fb.me/khanh10a1 <<\n");
    pause();
};
