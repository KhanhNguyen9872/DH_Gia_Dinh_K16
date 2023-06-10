/*
Nhập 4 số nguyên a, b, c, d.
Hãy sắp xếp giá trị của 4 số nguyên này theo thứ tự tăng dần.
*/
#include<stdio.h>

void process(int *a1, int *b1, int *c1, int *d1){
    int a=*a1, b=*b1, c=*c1, d=*d1;
    if(a>b){
        a=a+b;
        b=a-b;
        a=a-b;
    }
    if(a>c){
        a=a+c;
        c=a-c;
        a=a-c;
    }
    if(a>d){
        a=a+d;
        d=a-d;
        a=a-d;
    }
    if(b>c){
        b=b+c;
        c=b-c;
        b=b-c;
    }
    if(b>d){
        b=b+d;
        d=b-d;
        b=b-d;
    }
    if(c>d){
        c=c+d;
        d=c-d;
        c=c-d ;
    }
    *a1=a, *b1=b, *c1=c, *d1=d;
    return;
}

int main(int argc, char const *argv[])
{
    int a,b,c,d;
    printf("Nhập a: "); scanf("%d",&a);
    printf("Nhập b: "); scanf("%d",&b);
    printf("Nhập c: "); scanf("%d",&c);
    printf("Nhập d: "); scanf("%d",&d);
    process(&a,&b,&c,&d);
    printf("Kết quả: %d %d %d %d",a,b,c,d);
    getchar();
    getchar();
    return 0;
}
