#include<iostream>

using namespace std;

int maxQueue = 5;
int soPhanTuTrongQueue = 0;
int viTriDau = 0;
int viTriCuoi = -1;

void enqueue(int queue[], int value) {
    if (soPhanTuTrongQueue >= maxQueue) {
        cout << "FULL\n";
        return;
    };
    viTriCuoi++;
    if(viTriCuoi > maxQueue - 1) {
        viTriCuoi = 0;
    };
    queue[viTriCuoi] = value;
    soPhanTuTrongQueue++;
    return;
};

void dequeue(int queue[]) {
    if (soPhanTuTrongQueue <= 0) {
        cout << "\nNULL";
        return;
    };
    cout << queue[viTriDau] << "\n";
    viTriDau++;
    if(viTriDau > maxQueue - 1) {
        viTriDau = 0;
    };
    soPhanTuTrongQueue--;
    return;
};

int main(int argc, char const *argv[]) {
    int queue[maxQueue] = {0};
    enqueue(queue, 1);
    enqueue(queue, 2);
    enqueue(queue, 3);
    enqueue(queue, 4);
    enqueue(queue, 5);
    enqueue(queue, 6);

    dequeue(queue);
    dequeue(queue);
    dequeue(queue);
    dequeue(queue);
    dequeue(queue);
    dequeue(queue);
    dequeue(queue);
    dequeue(queue);
    
    cin.get();
    cin.get();
    return 0;
};
