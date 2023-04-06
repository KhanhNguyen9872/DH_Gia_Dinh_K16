/*
Nhập điểm thi và hệ số 3 môn Toán, Lý, Hóa của một sinh viên.
Tính điểm trung bình của sinh viên đó.
*/
#include<stdio.h>

void nhap(int *tmp){
    scanf("%d",&*tmp);
}

void tinh(int toan, int ly, int hoa, int hetoan, int hely, int hehoa, float *diemtb){
    *diemtb = (float)((toan*hetoan)+(ly*hely)+(hoa*hehoa))/(hetoan+hely+hehoa);
}

int main(int argc, char const *argv[]) {
    int toan,ly,hoa,hetoan,hely,hehoa;
    float diemtb;
    printf("Nhap diem thi Toan: ");
    nhap(&toan);
    printf("Nhap diem thi Ly: ");
    nhap(&ly);
    printf("Nhap diem thi Hoa: ");
    nhap(&hoa);
    printf("Nhap he so Toan: ");
    nhap(&hetoan);
    printf("Nhap he so Ly: ");
    nhap(&hely);
    printf("Nhap he so Hoa: ");
    nhap(&hehoa);
    tinh(toan, ly, hoa, hetoan, hely, hehoa, &diemtb);
    printf("\nDiem trung binh: %.3f",diemtb);
    getchar();
    getchar();
    return 0;
}