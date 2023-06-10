/*
Hoán đổi 2 số của 2 biến với nhau
*/
#include<stdio.h>

void hoandoi(int *a, int *b){
    int tmp=*a;
    *a=*b;
    *b=tmp;
}

int main(int argc, char const *argv[])
{
    int a,b;
    printf("Nhap a: ");
    scanf("%d",&a);
    printf("Nhap b: ");
    scanf("%d",&b);
    hoandoi(&a,&b);
    printf("\na: %d\nb: %d",a,b);
    getchar();
    getchar();
    return 0;
}