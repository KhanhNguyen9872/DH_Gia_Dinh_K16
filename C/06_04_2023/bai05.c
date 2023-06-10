/* 
Nhập 2 số a và b. Tính tổng, hiệu, tích và thương của hai số đó 
*/
#include<stdio.h>

void tong(float a, float b, float *tmp){
    *tmp=a+b;
}

void hieu(float a, float b, float *tmp){
    *tmp=a-b;
}xz

void tich(float a, float b, float *tmp){
    *tmp=a*b;
}

void thuong(float a, float b, float *tmp){
    *tmp=a/b;
}

void nhap(float *tmp){
    scanf("%f",&*tmp);
}

int main(int argc, char const *argv[]) {
    float a,b,t,h,ti,th;
    printf("Nhap a: ");
    nhap(&a);
    printf("Nhap b: ");
    nhap(&b);
    tong(a,b,&t);
    hieu(a,b,&h);
    tich(a,b,&ti);
    thuong(a,b,&th);
    printf("\n Tong: %.3f", t);
    printf("\n Hieu: %.3f", h);
    printf("\n Tich: %.3f", ti);
    printf("\n Thuong: %.3f", th);
    getchar();
    getchar();
    return 0;
}