// Viet chuong trinh ngan hang voi cac chuc nang:
// deposit - gui tien
// withdraw - rut tien
// show balance - in so du hien tai
#include<stdio.h>

void print(int sodu, char name[]){
    printf("\n> Khach hang: %s\n",name);
    printf("> So du: %d VND\n",sodu);
}

void rut(int *sodu){
    int sotien=0;
    printf(">> Nhap so tien muon rut: ");
    scanf("%d",&sotien);
    *sodu=*sodu-sotien;
}

void gui(int *sodu){
    int sotien=0;
    printf(">> Nhap so tien muon gui: ");
    scanf("%d",&sotien);
    *sodu=*sodu+sotien;
}

int main(int argc, char const *argv[])
{
    int sodu=0;
    char name[100];
    printf("Nhap ten cua ban: ");
    gets(name);
    print(sodu,name);
    gui(&sodu);
    print(sodu,name);
    rut(&sodu);
    print(sodu,name);
    getchar();
    getchar();
    return 0;
}
