#include <iostream>
#include <time.h>


using namespace std;

void vetcan(int a[], int arraySize, int target) {
    bool check = false;
    for(int i=0; i<arraySize; i++) {
        if (a[i] == target) {
            cout << "\n Da tim thay " << target << " tai vi tri " << i << "\n";
            check = true;
            break;
        }
    }
    if (!check) {
        cout << "\n khong tim thay " << target << "\n";
    }
}

void linhcanh(int a[], int arraySize, int target) {
    int *newArray = new int[arraySize + 1];
    int i;
    for(i=0; i<arraySize; i++) {
        newArray[i] = a[i];
    };
    newArray[arraySize] = target;

    for(i=0; i<=arraySize; i++) {
        if(target == newArray[i]) {
            if(i == arraySize) {
                cout << "\n Khong tim thay " << target << "\n";
            } else {
                cout << "\n Da tim thay " << target << " tai vi tri " << i << "\n";
                break;
            };
        };
    };
};

void nhiphan(int a[], int arraySize, int target) {
    int left = 0, right = arraySize - 1;
    int mid;
    bool check = false;
    while(left <= right) {
        mid = (left + right) / 2;
        if(a[mid] == target) {
            cout << "\n Tim thay " << target << " tai vi tri " << mid << "\n";
            check = true;
            break;
        } else if (a[mid] > target) {
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }
    if (!check) {
        cout << "\n Khong tim thay " << target << "\n";
    }
}

int main(int argc, char const *argv[])
{
    srand(time(NULL));
    int arraySize = 500000;
    int *array = new int[arraySize];
    for(int i=0; i<arraySize; i++) {
        //array[i] = rand() % 100;
        array[i] = i + 100;
    };

    int x;
    cout << "\n Nhap gia tri x: ";
    cin >> x;
    vetcan(array, arraySize, x);

    linhcanh(array, arraySize, x);

    nhiphan(array, arraySize, x);
    cin.get();
    cin.get();
    return 0;
}
