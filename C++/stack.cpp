#include<iostream>

using namespace std;

int sizeStack = 5;
int locationStack = -1;

void pop(int stack[]) {
    if (locationStack < 0) {
        cout << "\nNULL";
        return;
    };
    cout << (char)stack[locationStack];
    locationStack--;
    return;
};

void push(int stack[], int value) {
    if (locationStack > sizeStack - 1) {
        return;
    };
    locationStack++;
    stack[locationStack] = value;
    return;
};

void runStack(int stack[], string str) {
    // push
    int i;
    // for(i = str.length() - 1; i >= 0; i--) {
    //     if (str[i] == '*') {
    //         continue;
    //     };
    //     push(stack, str[i]);
    // };
    for(i = 0; i < str.length(); i++) {
        if (str[i] == '*') {
            pop(stack);
        } else {
            push(stack, str[i]);
        };
    };
    return;
};

// void runPop(int stack[], int length) {
//     // pop
//     int i;
//     for(i = 0; i < length; i++) {
//         pop(stack);
//     };
//     return;
// };

int main(int argc, char const *argv[]) {
    /*
        cài đặt stack
        1. hàm push
        2. hàm pop
        3. thêm và lấy lần lượt vào stack như sau
        EAS*Y**QUE***ST***I*ON
        gặp ký tự là thêm vào, dấu "*" là lấy ra =>> in kết quả ra màn hình
    */

    int i;
    string str = "EAS*Y**QUE***ST***I*ON";
    sizeStack = str.length();
    int stack[sizeStack] = {0};
    
    runStack(stack, str);
    // runPop(stack, str.length());
    // pause terminal
    cin.get();
    cin.get();
    return 0;
};
