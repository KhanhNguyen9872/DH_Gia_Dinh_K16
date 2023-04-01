// Nguyen Van Khanh (KhanhNguyen9872) - 22150129 - 221402
// Goormide GCC-9
//
// Viet chuong trinh ngan hang voi cac chuc nang:
// deposit - gui tien
// withdraw - rut tien
// show balance - in so du hien tai
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#define MAX 100

void clear();
void hi(char name[]);
void pause();
void main_scr(char name[], long money);
bool check_name(char name[]);
char name_upper(char name[]);
long deposit_withdraw(char name[], long money, bool is_depo);

int main(int argc, char const *argv[])
{
    long money=0;
    char name[MAX];
    int tmp;
    while(1){
        clear();
        printf(" @@ Chao mung ban da den voi Ngan hang Ajribamk @@\n\n");
        printf(">> Nhap ho va ten: ");
        gets(name);
        if(!check_name(name)){
            printf("\nTen khong hop le! Ten chi trong khoang [A-Za-z]\n\n > Nhan Enter de tiep tuc! <");
            getchar();  
        } else {
            name_upper(name);
//            {
//                int egg=1477;
//                for(int i=0;i<strlen(name);i++){
//                    tmp=tmp+(int)name[i];
//                };
//                if(tmp==egg){
//                    money=money+10000000000;
//                };
//            };
            break;
        }
    };
    while(1){
        tmp=0;
        main_scr(name,money);
        scanf("%d",&tmp);
        getchar();
        switch(tmp){
            case 1:money=deposit_withdraw(name,money,0);break;
            case 2:money=deposit_withdraw(name,money,1);break;
            case 3:clear();printf("\nSee you later:3\n");pause();return 0;
            // default:getchar();
        };
    };
    return 0;
};

long deposit_withdraw(char name[], long money, bool is_depo){
    long tmp=0;
    char is_yes[MAX];
    clear();
    hi(name);
    printf("Vui long nhap so tien muon %s!\n\n",(is_depo ? "rut" : "gui"));
    printf(" >> So tien (VND): ");
    scanf("%lu",&tmp);
    getchar();
    printf(" >> Ban co muon %s tien khong? [Y/n]: ",(is_depo ? "rut" : "gui"));
    gets(is_yes);
    if(((int)is_yes[0]==121)||((int)is_yes[0]==89)){
        if(tmp<=0){
            printf("\n!!! So tien ban nhap vao bang 0 hoac thap hon !!!\n");
            pause();
            return money;
        };
        if(tmp>2000000000){
            printf("\n!!! So tien trong 1 lan khong duoc qua 2.000.000.000 VND !!!\n");
            pause();
            return money;
        };
        if(is_depo){
            if(!money){
                printf("\n!!! Khong co tien ma cung muon rut sao? !!!\n");
                pause();
                return money;
            };
            if(tmp > money){
                printf("\n!!! So tien muon rut vuot qua so du cua ban !!!\n");
                pause();
                return money;
            };
        } else {
            if(money+tmp>10000000000){
                printf("\n!!! So tien dang co hien dang qua muc cho phep !!!\n%-12s Toi da: 10.000.000.000 VND %10s\n","!!!","!!!");
                pause();
                return money;
            };
        };
        printf("\n << %s tien thanh cong >>\n",(is_depo ? "Rut" : "Gui"));
        pause();
        return (is_depo ? money-tmp : money+tmp);
    } else {
        return money;
    };
};

char name_upper(char name[]){
    bool tmp=1;
    for(int i=0;i<strlen(name);i++){
        if(name[i]==' '){
            tmp=1;
            continue;
        };
        if((tmp)&&(97<=(int)name[i])&&((int)name[i]<=122)){
            name[i] = name[i] - 32;
            tmp=0;
        } else {
            tmp=0;
        };
    };
};

bool check_name(char name[]){
    for(int i=0;i<strlen(name);i++){
        if(((65<=(int)name[i])&&((int)name[i]<=90)) || ((97<=(int)name[i])&&((int)name[i]<=122)) || ((int)name[i]==32)){
        	continue;
        } else {
            return 0;
        };
    };
    return 1;
};

void hi(char name[]){
    printf(" @@ Ngan hang Ajribamk @@\n");
    printf(" ** Xin chao %s **\n\n",name);
};

void main_scr(char name[], long money){
    clear();
    hi(name);
    printf("> So du hien tai: %lu VND\n\n",money);
    printf(" 1. Gui tien\n 2. Rut tien\n 3. Thoat\n\n>> Lua chon: ");
};

void pause(){
    printf("\n > Nhan Enter de tiep tuc! <");
    getchar();
};

void clear()
{
    system("@cls||clear");
};