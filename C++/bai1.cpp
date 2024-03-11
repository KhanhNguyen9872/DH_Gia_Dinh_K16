// Nhap vao 1 day so, tinh trung binh, tim so lon nhat / be nhat

#include<iostream>

using namespace std;

int main() {
    int n;
    cout << "Nhap n: ";
    cin >> n;
    int daySo[n];
    int tong = 0;
    // Nhap day so
    for(int i=0; i<n; i++) {
        cout << "Nhap so thu " << i << ": ";
        cin >> daySo[i];
        tong = tong + daySo[i];
    }
    
    int maxNum = daySo[0], minNum = daySo[0];
    // Max
    for(int i=1; i<n; i++) {
        if (daySo[i] > maxNum) {
            maxNum = daySo[i];
        }
    }
    //

    cout << "Trung binh: " << tong/n << "\n";
    cout << "So lon nhat: " << maxNum + "\n";
    cout << "So be nhat: " << minNum + "\n";
    return 0;
}