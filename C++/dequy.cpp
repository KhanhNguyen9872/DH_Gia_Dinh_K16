#include<iostream>

using namespace std;

/**********************************************************************************************************************
1. Tính p(n) = xn, n nguyên và n>=1
2. Tính n! ( n nguyên và n>=0 )
3. Tìm số UCLN bằng đệ quy
4. Tính S(n)= 1/2 + 2/3 + 3/4 +...+n/(n+1)
5. Tính S(x,n)= x + x2 + x3 + ... + xn
6. Tính tổng n phần tử trong mảng số nguyên
7. Giải bài toán tháp Hà Nội
************************************************************************************************************************/

long long sumArray(int array[], int sizeArray) {
    if (sizeArray == 0) {
        return array[sizeArray];
    };
    return sumArray(array, sizeArray - 1) + (array[sizeArray]);
};

long long xN(int x, int n) {
    if (n == 1) {
        return x;
    };
    return xN(x, n - 1) * x;
};

long long sXN(int x, int n) {
    if (n == 1) {
        return xN(x, n);
    };
    return sXN(x, n - 1) + xN(x, n);
};

float sN(int n) {
    if (n == 1) {
        return (float)1 / 2;
    };
    return sN(n - 1) + (float)n / (n + 1);
};

long long giaiThua(int n) {
    if ((n == 0) || (n == 1)) {
        return 1;
    };
    return giaiThua(n - 1) * n;
};

long long UCLN(int a, int b) {
    if (b == 0) {
        return a;
    };
    return UCLN(b, a % b);
};

void printArray(int array[], int sizeArray) {
    int i;
    for(i = 0; i < sizeArray; i++) {
        if (i == (sizeArray - 1)) {
            cout << array[i];
            continue;
        };
        cout << array[i] << ", ";
    };
    return;  
};

int main(int argc, char const *argv[]) {
    int x = 30;
    int n = 8;
    int sizeArray = 15;
    int array[sizeArray] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 10, 11, 12, 13, 14};

    cout << "int x = " << x << ", " << "n = " << n << ", sizeArray = " << sizeArray << ";\n";
    cout << "int array[sizeArray] = {";
    printArray(array, sizeArray);
    cout << "};\n\n";

    cout << "xN(" << x << ", " << n << "); -> " << xN(x, n) << "\n";
    
    cout << "giaiThua(" << n << "); -> " << giaiThua(n) << "\n";

    cout << "UCLN(" << x << ", " << n << "); -> " << UCLN(x, n) << "\n";

    cout << "sN(" << n << "); -> " << sN(n) << "\n";

    cout << "sXN(" << x << ", " << n << "); -> " << sXN(x, n) << "\n";

    cout << "sumArray(array, " << sizeArray << "); -> " << sumArray(array, sizeArray - 1) << "\n";

    cin.get();
    cin.get();
    return 0;
};
