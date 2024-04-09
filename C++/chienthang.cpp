#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

struct PHANSO {
    int tuSo;
    int mauSo;
};

void NhapMang(PHANSO a[], int n) {
    srand(time(0));
    for (int i = 0; i < n; ++i) {
        a[i].tuSo = rand() % 99 + 1;
        a[i].mauSo = rand() % 99 + 1;
    }
}

void XuatMang(PHANSO a[], int n) {
    for (int i = 0; i < n; ++i) {
        cout << "a[" << i << "]= " << a[i].tuSo << "/" << a[i].mauSo <<" (" << (double)a[i].tuSo / a[i].mauSo<<")"<< endl;
    }
}

void XuatMangCoMauChiaHetCho2(PHANSO a[], int n) {
    for (int i = 0; i < n; ++i) {
        if(a[i].mauSo % 2 ==0)
        {cout << "a[" << i << "]= " << a[i].tuSo << "/" << a[i].mauSo << endl;};
    }
}


void Swap(PHANSO &a, PHANSO &b) {
    PHANSO temp = a;
    a = b;
    b = temp;
}

int Partition(PHANSO arr[], int low, int high) {
    PHANSO pivot = arr[high];
    int i = low - 1;

    for (int j = low; j < high; j++) {
        if ((double)arr[j].tuSo / arr[j].mauSo <= (double)pivot.tuSo / pivot.mauSo) {
            i++;
            Swap(arr[i], arr[j]);
        }
    }

    Swap(arr[i + 1], arr[high]);
    return i + 1;
}

void QuickSort(PHANSO arr[], int low, int high) {
    if (low < high) {
        int pi = Partition(arr, low, high);

        QuickSort(arr, low, pi - 1);
        QuickSort(arr, pi + 1, high);
    }
}

bool KTNguyenTo(int n) {
    int i;
    if (n <= 1) {
        return false;
    };
    for(i = 2; i < n; ++i) {
        if (n % i == 0) {
            return false;
        };
    };
    return true;
};

void XuatMangSoNguyenTo(PHANSO *a, int n) {
    
    int i;
    for(i = 0; i < n; ++i) {
        if ((KTNguyenTo(a[i].tuSo)) && (KTNguyenTo(a[i].mauSo))) {
            cout << "a[" << i << "]= " << a[i].tuSo << "/" << a[i].mauSo << "\n";
        };
    };
    return;
};

void bai1(PHANSO *&a, int &n){
    cout << "Moi nhap so luong phan tu= ";
    cin >> n;
    a = new PHANSO[n];
    NhapMang(a, n);
    cout << "\nPhan so co mau so chia het cho 2: " << endl;
    XuatMangCoMauChiaHetCho2(a, n);
};

void bai2(PHANSO *a, int n){cout << "\nMang ban dau: " << endl;
    XuatMang(a,n);
    QuickSort(a, 0, n - 1);
    cout << "\nMang sau khi sap xep: " << endl;
    XuatMang(a, n);
};

void bai3(PHANSO *a, int n){cout << "\nCac mang co tu va mau la so nguyen to la: "<< endl;
    XuatMangSoNguyenTo(a,n);
};

int main() {
    int n;
    PHANSO *arr;
    
    bai1(arr,n);
    bai2(arr,n);
    bai3(arr,n);

    cin.get();
    cin.get();
    return 0;
}