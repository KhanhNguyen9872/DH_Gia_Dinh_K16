/* 
Nhập vào 2 số nguyên.
Tính min và max của hai số đó.
*/
#include<stdio.h>

void process(int a, int b, int *min, int *max){
    *min=(a>b ? b : a);
    *max=(a>b ? a : b);
}

void nhap(int *tmp){
    scanf("%d",&*tmp);
}

int main(int argc, char const *argv[])
{
    int a,b,min,max;
    printf("Nhap a: ");
    nhap(&a);
    printf("Nhap b: ");
    nhap(&b);
    process(a,b,&min,&max);
    printf("\nmin: %d",min);
    printf("\nmax: %d",max);
    getchar();
    getchar();
    return 0;
}
