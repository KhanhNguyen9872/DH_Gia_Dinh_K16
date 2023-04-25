/*
Giải phương trình bậc nhất ax+b=0

+ Nhập vào các hệ số a và b
+ Nếu a==0:
    - Nếu b==0 => Vô số nghiệm (hay vô định)
    - Nếu b!=0 => Vô nghiệm
+ Nếu a!=0:
    - Phương trình có nghiệm là x = -b/a
*/

#include<stdio.h>

void process(float a, float b){
    if(a==0)if(b==0) printf("Vô số nghiệm");
            else printf("Vô nghiệm");
    else printf("Phương trình có nghiệm là x = %.3f",-b/a);
    return;
}

int main(int argc, char const *argv[])
{
    float a,b;
    printf("Nhập a: "); scanf("%f",&a);
    printf("Nhập b: "); scanf("%f",&b);
    printf("Kết quả: ");
    process(a,b);
    getchar();
    getchar();
    return 0;
}
