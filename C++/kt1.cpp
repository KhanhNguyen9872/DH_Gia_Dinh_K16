#include<iostream>

using namespace std;

struct PHANSO {
    int tuSo;
    int mauSo;
};

void pauseConsole() {
    cin.get();
    cin.get();
    return;
};

void nhapMang(PHANSO *a, int n) {
    int i;
    int tuSo, mauSo;
    for(i = 0; i < n; ++i) {
        cout << "Nhap tu so a[" << i << "]: ";
        cin >> a[i].tuSo;
        cout << "Nhap mau so a[" << i << "]: ";
        cin >> a[i].mauSo;
        cout << "\n";
    };
    return;
};

void xuatMang(PHANSO *a, int n) {
    int i;
    for(i = 0; i < n; ++i) {
        cout << "a[" << i << "] = " << a[i].tuSo << "/" << a[i].mauSo << "\n";
    };
    return;
};

void bai1(PHANSO *a, int n) {
    nhapMang(a, n);
    xuatMang(a, n);
    return;
};

void bai2(PHANSO *a, int n) {
    int vt1 = -1, vt2 = -1;
    cout << "\n";

    while ((vt1 < 0) || (vt1 > n - 1)) {
        cout << "Nhap vi tri 1: ";
        cin >> vt1;
    };

    while ((vt2 < 0) || (vt2 > n - 1)) {
        cout << "Nhap vi tri 2: ";
        cin >> vt2;
    };

    double kq1 = (double)a[vt1].tuSo / a[vt1].mauSo;
    double kq2 = (double)a[vt2].tuSo / a[vt2].mauSo;

    if (kq1 == kq2) {
        cout << "2 phan so bang nhau: " << kq1 << " = " << kq2 << "\n";
    } else if (kq1 > kq2) {
        cout << "Phan so " << a[vt1].tuSo << "/" << a[vt1].mauSo << " (" << kq1 << ")" << " lon hon " << a[vt2].tuSo << "/" << a[vt2].mauSo << " (" << kq2 << ")" "\n"; 
    } else {
        cout << "Phan so " << a[vt1].tuSo << "/" << a[vt1].mauSo << " (" << kq1 << ")" << " be hon " << a[vt2].tuSo << "/" << a[vt2].mauSo << " (" << kq2 << ")" "\n"; 
    };
    return;
};

void bai3(PHANSO *a, int n) {


    return;
};


int main(int argc, char const *argv[]) {
    /*
        1. (3d) hàm nhập xuất mảng PHANSO n phần tử nhập từ bàn phím
        2. (4d) so sánh 2 phân số bất kỳ trong mảng
        3. (3d) 
    */
    // Nguyễn Văn Khánh - 22150129 - 221402 

    int n;
    cout << "Nhap n: ";
    cin >> n;
    PHANSO *a = new PHANSO[n];

    bai1(a, n);
    bai2(a, n);
    bai3(a, n);

    pauseConsole();

    delete []a;
    return 0;
};
