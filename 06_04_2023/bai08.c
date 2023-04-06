/*
Nhập bán kính của đường tròn.
Tính chu vi và diện tích của hình tròn đó.
*/
#include<stdio.h>
#define PI 3.14

void tinh(float bankinh, float *chuvi, float *dientich){
    *chuvi=2*PI*bankinh;
    *dientich=PI*bankinh*bankinh;
}

void nhap(float *tmp) {
    scanf("%f",&*tmp);
}

int main(int argc, char const *argv[]) {
    float bankinh, chuvi, dientich;
    printf("Nhap ban kinh (cm): ");
    nhap(&bankinh);
    tinh(bankinh,&chuvi,&dientich);
    printf("\nChu vi: %.3f cm\nDien tich: %.3f cm",chuvi,dientich);
    getchar();
    getchar();
    return 0;
}