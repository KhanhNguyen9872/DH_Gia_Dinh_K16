/* 
Nhập năm sinh của một người. Tính tuổi người đó 
*/
#include<stdio.h>

void tinhtuoi(int *a){
    *a=2023-*a;
}

void nhap(int *tmp){
    scanf("%d",&*tmp);
}

int main(int argc, char const *argv[]) {
    int a;
    printf("Nhap nam sinh cua ban: ");
    nhap(&a);
    tinhtuoi(&a);
    printf("\nTuoi cua ban: %d",a);
    getchar();
    getchar();
    return 0;
}