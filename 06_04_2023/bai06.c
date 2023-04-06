/* 
Nhập tên sản phẩm, số lượng và đơn giá.
Tính tiền và thuế giá trị gia tăng phải trả, biết:
a) tiền = số lượng * đơn giá
b) thuế giá trị gia tăng = 10% tiền
*/
#include<stdio.h>

void tinhtien(int *tien, int soluong, int dongia){
    *tien=soluong*dongia;
}

void tinhthue(int *thue, int tien){
    *thue=tien/100*10;
}

void nhap(int *tmp){
    scanf("%d",&*tmp);
}

int main(int argc, char const *argv[]) {
    int tien,soluong,dongia,thue;
    char tensp[100];
    printf("Nhap ten san pham: ");
    gets(tensp);
    printf("Nhap so luong: ");
    nhap(&soluong);
    printf("Nhap don gia: ");
    nhap(&dongia);
    tinhtien(&tien,soluong,dongia);
    tinhthue(&thue,tien);
    printf("\nTen san pham: %s",tensp);
    printf("\nTien: %d", tien);
    printf("\nThue gia tri gia tang: %d", thue);
    getchar();
    getchar();
    return 0;
}