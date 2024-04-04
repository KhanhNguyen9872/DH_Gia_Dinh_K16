#include<iostream>
using namespace std;

struct Node {
    int key;
    Node *next;
};

Node *newNode(int data) {
    Node *temp = new Node;
    temp->key = data;
    temp->next = NULL;
    return temp;
};

void getNode(Node *pHead) {
    cout << "\nNode: ";
    while(pHead != NULL) {
        cout << pHead->key << ' ';
        pHead = pHead->next; 
    };
    cout << "\n";
    return;
};

void addHead(Node *&pHead, int data) {
    // data = 2
    // pHead (1, NULL)
    Node *temp = newNode(data);
    // pHead = (key = 3, next = (key = 2, next = (key = 1, next = NULL)))
    // pHead = (key = 2, next = (key = 1, next = NULL))
    // pHead = (key = 1, next = NULL)
    // pHead = NULL
    if(pHead == NULL) {
        pHead = temp;
    } else {
        temp->next = pHead;
        pHead = temp;
    };
    return;
};

void pauseConsole() {
    cin.get();
    cin.get();
    return;
};

void addLast(Node *&pHead, int data) {
    Node *temp = newNode(data);
    if (pHead == NULL) {
        pHead = temp;
    } else {
        Node *temp1 = pHead;
        while (temp1->next != NULL) {
            temp1 = temp1->next;
        };
        temp1->next = temp;
    };
    return;
};

int getLengthNode(Node *&pHead){
    int length = 0;
    Node *tmp = pHead;
    while (tmp != NULL){
        tmp = tmp->next;
        length++;
    };
    return length;
};

void addMid(Node *&pHead, int data) {
    int count = 0;
    int lengthNode = getLengthNode(pHead);
    int mid = (int)(lengthNode / 2);
    // if (mid > 0) {
    //     mid--;
    // };
    Node *temp = newNode(data);
    if (pHead == NULL) {
        pHead = temp;
    } else {
        Node *tmppHead = pHead;
        while (count < mid) {
            tmppHead = tmppHead->next;
            count++;
        };
        Node *tmpMid = tmppHead->next;
        temp->next = tmpMid;
        tmppHead->next = temp;
    };
    return;
};

bool findX(Node *&pHead, int x) {
    Node *tmp = pHead;
    while(pHead->key != x) {
        pHead = pHead->next;
    };
    if (pHead != NULL) {
        return 1;
    };
    return 0;
};

void addAfterX(Node *pHead, int x) {
    bool check = findX(pHead, x);
    if (check) {
        while(pHead != NULL) {
            if (pHead->key != x) {
                pHead = pHead->next;
            } else {
                break;
            };
        };
        int data;
        cout << "\nNhap gia tri can them: ";
        cin >> data;
        Node *temp = newNode(data);
        temp->next = pHead->next;
        pHead->next = temp;
    };
};

void removeHead(Node *&pHead) {
    pHead = pHead->next;
    return;
};

void removeLast(Node *&pHead) {
    Node *tmp = pHead;
    while(tmp->next->next != NULL) {
        tmp = tmp->next;
    };
    tmp->next = NULL;
    return;
};

void removeX(Node *&pHead, int x) {

    return;
};

int main(int argc, char const *argv[]) {
    /*
        1. Thêm phần tử (đầu, cuối, giữa)
        2. Duyệt danh sách
        3. Xóa phần tử (đầu, cuối, xóa phần tử x)
        4. Truy xuất phần tử
        5. Xóa danh sách (xóa toàn bộ danh sách)
        6. Đếm số lượng node/phần tử trong danh sách
    */
    Node *pHead = NULL;
    addHead(pHead, 1);
    addHead(pHead, 2);
    addHead(pHead, 3);
    addHead(pHead, 4);
    getNode(pHead);

    addLast(pHead, 5);
    getNode(pHead);

    addAfterX(pHead, 3);
    getNode(pHead);

    addMid(pHead, 6);
    getNode(pHead);

    removeHead(pHead);
    getNode(pHead);

    removeLast(pHead);
    getNode(pHead);

    pauseConsole();
    return 0;
};
