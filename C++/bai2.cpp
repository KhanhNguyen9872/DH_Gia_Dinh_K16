// Nhập mảng 1 triệu phần tử 
// Gán giá trị ngẫu nhiên từ 0 đến 99
// tính giá trị trung bình
// đếm số làn xuất hiện của các số 0 đén 99
// vẽ sơ đồ minh họa phân phối chuẩn

#include <iostream>
#include <cstdlib> 
#include <time.h>

using namespace std;

int main(int argc, char const *argv[])
{
    srand(time(NULL));
    double total = 0;
    int arraySize = 1000000;
    int *array = new int[arraySize];
    for(int i=0; i<arraySize; i++) {
        array[i] = rand() % 100;
        total = total + array[i];
    };

    cout << "- Tong: " << (int)total << "\n";
    double giatriTB = total / arraySize;
    cout << "- Gia tri trung binh: " << giatriTB << "\n";

    cout << "- So lan xuat hien: \n";
    int count;
    for(int i=0; i<100; i++) {
        count = 0;
        for(int j=0; j<arraySize; j++) {
            if (i == array[j]) {
                count = count + 1;
            }
        }
        cout << " " << i << " [" << count << "]\t";
        for(int j=0; j<count; j = j + 250) {
            cout << "=";
        };
        cout << "\n";
    };

    cin.get();
    return 0;
};
