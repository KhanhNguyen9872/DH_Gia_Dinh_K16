/* 
Nhập vào 2 số nguyên.
Tính min và max của hai số đó.
*/
#include<stdio.h>

void process(int a, int b, int *min, int *max){
    *min=(a>b ? b : a);
    *max=(a>b ? a : b);
}

int main(int argc, char const *argv[])
{
    int a,b,min,max;
    printf("Nhap a: ");
    scanf("%d",&a);
    printf("Nhap b: ");
    scanf("%d",&b);
    process(a,b,&min,&max);
    printf("\nmin: %d",min);
    printf("\nmax: %d",max);
    getchar();
    getchar();
    return 0;
}
