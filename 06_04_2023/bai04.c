/* 
Nhập năm sinh của một người. Tính tuổi người đó 
*/
#include<stdio.h>

// void tinhtuoi(int *a){
//     *a=2023-*a;
// }

// void nhap(int *tmp){
//     scanf("%d",&*tmp);
// }

// int main(int argc, char const *argv[]) {
//     int a;
//     printf("Nhap nam sinh cua ban: ");
//     nhap(&a);
//     tinhtuoi(&a);
//     printf("\nTuoi cua ban: %d",a);
//     getchar();
//     getchar();
//     return 0;
// }

int tinhtuoi(int namsinh){
    return 2023-namsinh;
}

int main(int argc, char const *argv[])
{
    int namsinh, tuoi;
    printf("Nhap nam sinh: ");
    scanf("%d",&namsinh);
    tuoi=tinhtuoi(namsinh);
    printf("Tuoi cua ban: %d",tuoi);
    getchar(); getchar();
    return 0;
}
