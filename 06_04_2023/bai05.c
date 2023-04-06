/* 
Nhập 2 số a và b. Tính tổng, hiệu, tích và thương của hai số đó 
*/
#include<stdio.h>

void tong(int a, int b, float *tmp){
    *tmp=a+b;
}

void hieu(int a, int b, float *tmp){
    *tmp=a-b;
}

void tich(int a, int b, float *tmp){
    *tmp=a*b;
}

void thuong(int a, int b, float *tmp){
    *tmp=(float)a/b;
}

void nhap(int *tmp){
    scanf("%d",&*tmp);
}

int main(int argc, char const *argv[]) {
    int a,b;
    float tmp=0;
    printf("Nhap a: ");
    nhap(&a);
    printf("Nhap b: ");
    nhap(&b);
    tong(a,b,&tmp);
    printf("\n Tong: %.0f", tmp);
    hieu(a,b,&tmp);
    printf("\n Hieu: %.0f", tmp);
    tich(a,b,&tmp);
    printf("\n Tich: %.0f", tmp);
    thuong(a,b,&tmp);
    printf("\n Thuong: %.3f", tmp);
    getchar();
    getchar();
    return 0;
}