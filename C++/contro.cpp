#include<iostream>
using namespace std;

void nhapMang(int mang[], int n) {
    int i;
    for(i = 0; i < n; ++i) {
        cout << "Nhap mang[" << i << "]: ";
        cin >> mang[i];
    };
    return;
};

void xuatMang(int mang[], int n) {
    int i;
    for(i = 0; i < n; ++i) {
        cout << mang[i] << " ";
    };
    return;
};

void add(int *&mang, int *n) {
    int i;
    int them;
    cout << "Nhap so pt can them: ";
    cin >> them;
    int kichThuocMoi = *n + them;
    int *tempMang = new int[kichThuocMoi];
    for(i = 0; i < *n; ++i) {
        tempMang[i] = mang[i];
    };
    for(i = *n; i < kichThuocMoi; ++i) {
        cout << "Nhap mang[" << i << "]: ";
        cin >> tempMang[i];
    };
    delete [] mang;
    mang = tempMang;
    *n = kichThuocMoi;
    return;
};

void del(int *&mang, int *n) {
    int i;
    int xoa = (int)(*n / 2);
    int kichThuocMoi = xoa;
    int *tempMang = new int[kichThuocMoi];
    for(i = 0; i < kichThuocMoi; ++i) {
        tempMang[i] = mang[i];
    };
    delete [] mang;
    mang = tempMang;
    *n = kichThuocMoi;
    return;
};

void pausedConsole() {
    cin.get();
    cin.get();
    return;
};

int main(int argc, char const *argv[])
{
    /*
        1. Xây dựng hàm nhập/xuất mảng
        2. Xây dựng hàm cấp phát thêm n phần tử
        3. Xây dựng hàm xóa 1/2 phần tử trong mảng   
    */

    int *mang;
    int n;
    cout << "Nhap n: ";
    cin >> n;
    mang = new int[n];
    nhapMang(mang, n);
    add(mang, &n);
    del(mang, &n);
    xuatMang(mang, n);
    pausedConsole();
    return 0;
}