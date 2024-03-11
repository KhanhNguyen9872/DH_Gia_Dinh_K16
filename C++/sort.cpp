#include<iostream>

using namespace std;

void reverse(int *a, int *b) {
    int tmp;
    tmp = *a;
    *a = *b;
    *b = tmp;
    return;
};

int partition(int mang[], int low, int high) {
    int last = mang[high];
    int i = low - 1; 

    for (int j = low; j < high; j++) {
        if (mang[j] < last) {
            i++;
            swap(mang[i], mang[j]);
        };
    };
    swap(mang[i + 1], mang[high]);
    return i + 1;
};

void quickSort(int mang[], int low, int high) {
    if (low < high) {
        int pi = partition(mang, low, high);

        quickSort(mang, low, pi - 1);
        quickSort(mang, pi + 1, high);
    };
    return;
};

int max(int mang[], int sizeMang) {
    int max = mang[0];
    for(int i = 1; i < sizeMang; i++) {
        if (mang[i] > max) {
            max = mang[i];
        };
    };
    return max;
};

int soLanChia(int n) {
    int dem = 1;
    while ((n / 10) > 0) {
        dem = dem + 1;
        n = n / 10;
    };
    return dem;
};

void radixSort(int mang[], int sizeMang) {
    int tmpMang[sizeMang];
    int count[10] = {0};
    int i, j;
    for(i = 0; i < sizeMang; i++) { // đếm số lần xuất hiện của từng số bậc đơn vị
        tmpMang[mang[i] % 10]++;
    };
    for(i = 0; i < sizeMang; i++) {
        int index = 0;
        for(j = 0; j < (mang[i] % 10); j++) {
            index = index + count[j];
        };
        tmpMang[index] = ;
    };
    return;
};


void selectionSort(int mang[], int sizeMang) {
    if (sizeMang < 1) {
        return;
    };
    cout << "\n>> Selection Sort...\n";
    int i, j, min, tmp;
    for(i = 0; i < sizeMang; i++) {
        min = i;
        for(j = (i + 1); j < sizeMang; j++) {
            if (mang[min] > mang[j]) {
                min = j;
            };
        };
        reverse(&mang[i], &mang[min]);
    };
    return;
};

void bubbleSort(int mang[], int sizeMang) {
    cout << "\n>> Bubble Sort...\n";
    int i, j;
    for(i = 0; i < sizeMang; i++) {
        for(j = 0; j < sizeMang - 1; j++) {
            if (mang[j] > mang[j + 1]) {
                reverse(&mang[j], &mang[j + 1]);
            };
        };
    };
    return;
};

void interchangeSort(int mang[], int sizeMang) {
    cout << "\n>> Interchange Sort...\n";
    int i, j;
    for(i = 0; i < sizeMang - 1; i++) {
        for(j = i + 1; j < sizeMang; j++) {
            if (mang[i] > mang[j]) {
                reverse(&mang[i], &mang[j]);
            };
        };
    };
    return;
};

void insertionSort(int mang[], int sizeMang) {
    cout << "\n>> Insertion Sort...\n";
    int i, tmp, j;
    for(i = 1; i < sizeMang; i++) {
        tmp = mang[i];
        j = i - 1;
        while((j >= 0) && (mang[j] > tmp)) {
            mang[j + 1] = mang[j];
            j = j - 1;
        };
        mang[j + 1] = tmp;
    };
    return;
};

void printMang(int mang[], int sizeMang) {
    int i;
    for(i = 0; i < sizeMang; i++) {
        // cout << "a[" << i << "] = " << mang[i] << "\n";
        cout << mang[i];
        if (i < sizeMang - 1) {
            cout << ", ";
        };
    };
    cout << "\n";
    return;
};

void copyArray(int a[], int sizeA, int b[], int sizeB) {
    int i;
    for(i = 0; i < sizeA; i++) {
        if (i < sizeB) {
            b[i] = a[i];
        } else {
            break;
        };
    };
    return;
};

void randomArray(int mang[], int sizeMang) {

    return;
};

void pauseConsole() {
    cin.get();
    return;    
};

int main(int argc, char const *argv[]) {
    int sizeMang = 20;
    int mangA[sizeMang] = {10, 12, 11, 16, 14, 13, 15, 19, 18, 17, 1, 3, 4, 7, 9, 0, 2, 5, 6, 8};
    int mangB[sizeMang];
    cout << ">> Original: \n";
    printMang(mangA, sizeMang);

    // selection Sort
    copyArray(mangA, sizeMang, mangB, sizeMang);
    selectionSort(mangB, sizeMang);
    printMang(mangB, sizeMang);

    // bubble Sort
    copyArray(mangA, sizeMang, mangB, sizeMang);
    bubbleSort(mangB, sizeMang);
    printMang(mangB, sizeMang);

    // interchange Sort
    copyArray(mangA, sizeMang, mangB, sizeMang);
    interchangeSort(mangB, sizeMang);
    printMang(mangB, sizeMang);

    // insertion Sort
    copyArray(mangA, sizeMang, mangB, sizeMang);
    insertionSort(mangB, sizeMang);
    printMang(mangB, sizeMang);

    // quick Sort
    copyArray(mangA, sizeMang, mangB, sizeMang);
    cout << "\n>> Quick Sort...\n";
    quickSort(mangB, 0, sizeMang - 1);
    printMang(mangB, sizeMang);

    cout << soLanChia(max(mangB, sizeMang));

    pauseConsole();
    return 0;
};
