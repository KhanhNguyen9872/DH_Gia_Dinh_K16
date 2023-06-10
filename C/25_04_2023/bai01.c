#include<stdio.h>
#define MAX 100

void nhapMang(int mang[],int n);
void printMang(int mang[], int n);

int main(int argc, char const *argv[])
{
    int mang[MAX],n;
    printf("Nhập độ dài của mảng: ");
    scanf("%d",&n);
    getchar();
    nhapMang(mang,n);
    printf("Kết quả: ");
    printMang(mang,n);
    getchar();
    getchar();
    return 0;
}

void nhapMang(int mang[],int n){
    for(int i=0;i<n;i++){
        printf("Nhập số thứ %d: ",i);
        scanf("%d",&mang[i]);
    }
    return;
}

void printMang(int mang[], int n){
    for(int i=0;i<n;i++) printf("%d ",mang[i]);
    return;
}