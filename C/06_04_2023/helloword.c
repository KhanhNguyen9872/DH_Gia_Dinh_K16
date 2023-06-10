#include<stdio.h>

void print(char *text[]){
    printf("%s",*text);
}

void hello(char text[]){
    print(&text);
}

void helloworld(char text[]){
    hello(text);
}

int main(){
    helloworld("Hello World!");
}