/*
Nhập độ dài 3 cạnh 1 tam giác.
Kiểm tra đó có phải là tam giác và là tam giác gì?
*/
#include<stdio.h>

void process(int a, int b, int c){
    if((a+b>c) && (a+c>b) && (b+c>a)){
        printf("%d, %d, %d la ba canh cua mot tam giac ",a,b,c);
        if ((a*a==b*b+c*c) || (b*b==a*a+c*c) || (c*c==a*a+b*b)) printf("vuong");
        else if ((a==b) && (b==c)) printf("deu");
        else if ((a==b) || (a==c) || (b==c)) printf("can");
        else if ((a*a > b*b+c*c) || (b*b > a*a+c*c) || (c*c > a*a+b*b)) printf("tu");
        else printf("nhon");
    } else printf("%d, %d, %d khong phai la ba canh cua mot tam giac!",a,b,c);
    return;
}

int main(int argc, char const *argv[])
{
    int a, b, c;
    printf("Nhập a: ");
    scanf("%d",&a);
    printf("Nhập b: ");
    scanf("%d",&b);
    printf("Nhập c: ");
    scanf("%d",&c);
    process(a,b,c);
    getchar(); getchar();
    return 0;
}
