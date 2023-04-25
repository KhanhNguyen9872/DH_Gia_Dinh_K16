/*
Nhập một chữ cái.
Nếu là chữ thường thì đổi sang chữ hoa, ngược lại đổi sang chữ thường.
*/

#include<stdio.h>

void process(char *text){
    if((*text>=65) && (*text<=90))*text=*text+32;
    else if((*text>=97) && (*text<=122))*text=*text-32;
    else *text='0';
    return;
}

int main(int argc, char const *argv[])
{
    char text;
    printf("Nhap 1 chu cai: ");
    scanf("%c",&text);
    process(&text);
    if(text=='0'){
        printf("Day khong phai la chu cai!");
        getchar();
        getchar();
        return 0;
    }
    printf("\nKet qua: %c",text);
    getchar();
    getchar();
    return 0;
}
