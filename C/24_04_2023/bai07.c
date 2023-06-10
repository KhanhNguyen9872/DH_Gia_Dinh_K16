/*
Nhập 4 số nguyên a,b,c và d.
Tìm số có giá trị nhỏ nhất (min).
*/
#include<stdio.h>
#define MAX 4

// int min(int a,int z[MAX]){
//     if(a==1) return z[0];
//     if(z[a]<z[a-1]) z[a-1]=z[a];
//     return min(a-1,z[a-1]);
// }

void min(int *n, int z[MAX]){
    *n=z[0];
    for(int i=1;i<MAX;i++)
        if(*n>z[i]) *n=z[i];
    return;
}

int main(int argc, char const *argv[])
{
    int z[MAX], min_num=0;
    for(int i=0;i<MAX;i++){
        printf("Nhập số thứ %d: ",i+1);
        scanf("%d",&z[i]);
    }
    min(&min_num,z);
    printf("Min: %d",min_num);
    getchar();
    getchar();
    return 0;
}
