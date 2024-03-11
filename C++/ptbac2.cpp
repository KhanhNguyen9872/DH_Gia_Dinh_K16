#include<iostream>
#include<string>
#include<math.h>

using namespace std;

string giaiPTBac2(float a, float b, float c) {
    float delta = (b*b) - (4*a*c);
    if (delta < 0) {
        return "Phuong trinh vo nghiem";
    } else if (!delta) {
        return "Phuong trinh co nghiep kep la: x1 = x2 = " + to_string(-b/(2*a));
    } else {
        return "Phuong trinh co 2 nghiem phan biet\n x1 = " + to_string(((-b+sqrt(delta))/(2*a))) + "\n x2 = " + to_string(((-b-sqrt(delta))/(2*a)));
    }
    return "";
};
 
int main() {
    float a, b, c;
    cout << "> Nhap a: ";
    cin >> a;
    cout << "> Nhap b: ";
    cin >> b;
    cout << "> Nhap c: ";
    cin >> c;
    cout << ">> Ket qua: " << giaiPTBac2(a, b, c) << "\n";
    cin.get();
    cin.get();
    return 0;
};