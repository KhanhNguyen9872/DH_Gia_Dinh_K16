/*
Tính tiền đi taxi từ số km nhập vào. Biết:
a) 1 km đầu giá 15000đ
b) Từ km thứ 2 đến km thứ 5 giá 13500đ
c) Từ km thứ 6 trở đi giá 11000đ
d) Nếu trên 129km được giảm 10% tổng tiền
*/
#include<stdio.h>

void process(int *tien, int km) {
    for(int i=1;i<=km;i++){
        if(i==1) *tien+=15000;
        else if((i>=2) && (i<=5)){
            *tien+=13500;
        } else {
            *tien+=11000;
        }
    }
    if(km>120) *tien=*tien/100*90;
    return;
}

int main(int argc, char const *argv[])
{
    int km, tien=0;
    printf("Nhập số km: "); scanf("%d",&km);
    process(&tien,km);
    printf("Kết quả: %d VND", tien);
    getchar();
    getchar();
    return 0;
}
