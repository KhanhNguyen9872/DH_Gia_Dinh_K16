/*
Giải phương trình bậc hai ax^2 + bx + c = 0

B1: Tính delta: Δ = b^2 – 4ac
B2: Kiểm tra delta cho từng trường hợp từ dễ đến khó
TH1: Δ < 0 => Phương trình vô nghiệm.
TH2: Δ = 0 => Phương trình có nghiệm kép x = -b / 2a 
TH3: Δ > 0 => Phương trình có 2 nghiệm x = -b (+-) sqrt(Delta) / 2a 
*/

#include<stdio.h>

double sqrt(double num)
{
    double tmp=num/3;
    int i;
    if (num <= 0) return 0;
    for (i=0; i<32; i++) tmp = (tmp + num / tmp) / 2;
    return tmp;
}

void process(float a, float b, float c){
    if(a == 0) {
        if(b == 0) {
            if (c == 0) {
                printf("Phương trình vô số nghiệm.\n");
            } else {
                printf("Phương trình vô nghiệm.\n");
            }
        } else printf("Phương trình có nghiệm x = %0.2f\n",-c/b);
    } else {
        float delta = (b*b) - 4*a*c;
        if(delta<0) printf("Phương trình vô nghiệm");
        else if(delta==0) printf("Phương trình có nghiệm kép x1 = x2 = %.3f",-b/2*a);
        else printf("Phương trình có 2 nghiệm phân biệt:\n x1 = %f\n x2 = %f\n", (-b+sqrt(delta))/(2*a), (-b-sqrt(delta))/(2*a));
    }
    return;
}

int main(int argc, char const *argv[])
{
    float a,b,c;
    printf("Nhập a: "); scanf("%f",&a);
    printf("Nhập b: "); scanf("%f",&b);
    printf("Nhập c: "); scanf("%f",&c);
    printf("Kết quả: ");
    process(a,b,c);
    getchar(); getchar();
    return 0;
}
