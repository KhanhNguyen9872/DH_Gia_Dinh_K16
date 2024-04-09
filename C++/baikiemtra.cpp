#include<iostream>
#include<time.h>

using namespace std;

struct PHANSO {
    int tuSo;
    int mauSo;
};

void pauseConsole() {
    cout << "\nPAUSED! Press Enter to continue!\n";
    cin.get();
    cin.get();
    return;
};

void nhapMang(PHANSO *a, int n) {
    srand(time(NULL));
    int i;
    for(i = 0; i < n; ++i) {
        a[i].tuSo = (rand() % 99) + 1;
        a[i].mauSo = (rand() % 99) + 1;
    };
    return;
};

void xuatMangMSChiaHetCho2(PHANSO *a, int n) {
    cout << "\n>> Xuat mang mauso chia het cho 2: \n";
    int i;
    bool check = false;
    for(i = 0; i < n; ++i) {
        if (a[i].mauSo % 2 == 0) {
            cout << "a[" << i << "] = " << a[i].tuSo << "/" << a[i].mauSo << "\n";
            check = true;
        };
    };
    if (!check) {
        cout << "Khong co phan so chua mauso chia het cho 2!\n";
    };
    return;
};

void swap(PHANSO *a, PHANSO *b) {
    PHANSO tmp;
    tmp = *a;
    *a = *b;
    *b = tmp;
    return;
};

int p(PHANSO *a, int low, int high) {
    int j;
    double last = (double)a[high].tuSo / a[high].mauSo;
    double tmp = 0;
    int i = low - 1; 

    for (j = low; j < high; ++j) {
        tmp = (double)a[j].tuSo / a[j].mauSo;
        if (tmp < last) {
            swap(a[++i], a[j]);
        };
    };
    swap(a[i + 1], a[high]);
    return i + 1;
};

void quickSort(PHANSO *a, int low, int high) {
    int mid;
    if (low < high) {
        mid = p(a, low, high);

        quickSort(a, low, mid - 1);
        quickSort(a, mid + 1, high);
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

bool soNguyenTo(int n) {
    int i;
    if (n <= 1) {
        return 0;
    };
    for(i = 2; i < n; ++i) {
        if (n % i == 0) {
            return 0;
        };
    };
    return 1;
};

void xuatMangSoNguyenTo(PHANSO *a, int n) {
    cout << "\n>> Xuat mang so nguyen to: \n";
    bool check = false;
    int i;
    for(i = 0; i < n; ++i) {
        if ((soNguyenTo(a[i].tuSo)) && (soNguyenTo(a[i].mauSo))) {
            cout << "a[" << i << "] = " << a[i].tuSo << "/" << a[i].mauSo << "\n";
            check = true;
        };
    };
    if (!check) {
        cout << "Khong co phan so nao co tuso va mauso la so nguyen to!\n";
    };
    return;
};

PHANSO* bai01(int *n) {
    cout << "Nhap n: ";
    cin >> *n;

    PHANSO *a = new PHANSO[*n];
    nhapMang(a, *n);
    xuatMangMSChiaHetCho2(a, *n);
    return a;
};

void bai02(PHANSO *a, int n) {
    quickSort(a, 0, n - 1);
    cout << "\n>> Xuat mang sau khi sap xep: \n";
    xuatMang(a, n);
    return;
};

void bai03(PHANSO *a, int n) {
    xuatMangSoNguyenTo(a, n);
    return;
};

int main(int argc, char const *argv[]) {
    /*
        1. (3d) Xây dựng hàm nhập mảng phân số có n phần, với n nhập từ bàn phím, gán ngẫu nhiên các giá trị tử số, mẫu số từ 1-99, xuất ra màn hình những phân số có mẫu số chia hết cho 2.
        2. (4d) Dựa trên mảng phân số đã nhập ngẫu nhiên ở câu 1, xây dựng hàm sắp xếp nhanh quicksort cho mảng phân số.
        3. (3d) Từ mảng n phần tử đã sắp ếp ở câu 2, xuất ra màn hình chỉ những phân số là có tử số và mẫu số đều là số nguyên tố.
    */

    // Nguyễn Văn Khánh - 22150129 - 221402 

    // bai 1
    int n;
    PHANSO *a = bai01(&n);

    // bai 2
    bai02(a, n);

    // bai 3
    bai03(a, n);

    pauseConsole();
    delete []a;
    return 0;
};
