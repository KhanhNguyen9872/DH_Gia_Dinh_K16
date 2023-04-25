/*
Nhập 1 số bất kì
Hãy đọc giá trị của số nguyên đó nếu nó có giá trị từ 0 đến 9, ngược lại thông báo không đọc được.
*/

#include<stdio.h>

void process(int num){
    switch (num)
    {
    case 0:
        printf("Không");
        break;
    case 1:
        printf("Một");
        break;
    case 2:
        printf("Hai");
        break;
    case 3:
        printf("Ba");
        break;
    case 4:
        printf("Bốn");
        break;
    case 5:
        printf("Năm");
        break;
    case 6:
        printf("Sáu");
        break;
    case 7:
        printf("Bảy");
        break;
    case 8:
        printf("Tám");
        break;
    case 9:
        printf("Chín");
        break;
    default:
        printf("Không đọc được");
        break;
    }
}

int main(int argc, char const *argv[])
{
    int num;
    printf("Nhập 1 số [0-9]: "); scanf("%d",&num);
    printf("Kết quả: ");
    process(num);
    getchar();
    getchar();
    return 0;
}
