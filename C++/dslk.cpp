#include<iostream>

using namespace std;

struct Node {
    Node *left, *right;
    int key;
};

Node *newNode(int data) {
    Node *newRoot = new Node;
    newRoot->key = data;
    newRoot->left = NULL;
    newRoot->right = NULL;
    return newRoot;
};

void addNode(Node *&root, int data) {
    if (root == NULL) {
        root = newNode(data);
    } else {
        if (root->key > data) {
            addNode(root->left, data);
        } else if (root->key < data) {
            addNode(root->right, data);
        };
    };
    return;
};

void pauseConsole(){
    cout << "\n>> Paused!\n";
    cin.get();
    cin.get();
    return;
};

void preOrder(Node *root) {
    if (root != NULL) {
        cout << root->key << " ";
        preOrder(root->left);
        preOrder(root->right);
    };
    return;
};

void inOrder(Node *root) {
    if (root != NULL) {
        inOrder(root->left);
        cout << root->key << " ";
        inOrder(root->right);
    };
    return;
};

void postOrder(Node *root) {
    if (root != NULL) {
        postOrder(root->left);
        postOrder(root->right);
        cout << root->key << " ";
    };
    return;
};

Node* findMin(Node* root) {
    while (root->left != NULL) {
        root = root->left;
    };
    return root;
};

Node* delNode(Node* root, int data) {
    if (root == NULL) {
        return root;
    };
    if (data < root->key) {
        root->left = delNode(root->left, data); 
    } else if (data > root->key) {
        root->right = delNode(root->right, data); 
    } else {
        if (root->left == NULL) {
            Node* temp = root->right;
            delete root;
            return temp;
        } else if (root->right == NULL) {
            Node* temp = root->left;
            delete root;
            return temp;
        };
        Node* temp = findMin(root->right);
        root->key = temp->key;
        root->right = delNode(root->right, temp->key);
    }
    return root;
};

void rightTurn(Node *&root) {
    Node *rootBanDau = root; // Lưu lại địa chỉ gốc ban đầu
    root = root->left; // gốc mới bên trái

    if (root->right == NULL) {
        rootBanDau->left = NULL;
    } else {
        rootBanDau->left = root->right;
    };
    root->right = rootBanDau;
    return;
};

void leftTurn(Node *&root) {
    Node *rootBanDau = root; // Lưu lại địa chỉ gốc ban đầu
    root = root->right; // gốc mới bên phải

    if (root->left == NULL) {
        rootBanDau->right = NULL;
    } else {
        rootBanDau->right = root->left;
    };
    root->left = rootBanDau;
    return;
};

/*
Them node: 8 1 9 7 5 6 4 3 2 0

preOrder: 8 1 0 7 5 4 3 2 6 9
inOrder: 0 1 2 3 4 5 6 7 8 9
postOrder: 0 1 2 3 4 5 6 7 9 8
*/

int main(int argc, char const *argv[]) {
    Node *root = NULL;
    cout << "Them node: 8 1 9 7 5 6 4 3 2 0\n";
    addNode(root, 8);
    addNode(root, 1);
    addNode(root, 9);
    addNode(root, 7);
    addNode(root, 5);
    addNode(root, 6);
    addNode(root, 4);
    addNode(root, 3);
    addNode(root, 2);
    addNode(root, 0);

    delNode(root, 7);

    cout << "\npreOrder: "; preOrder(root);
    cout << "\ninOrder: "; inOrder(root);
    cout << "\npostOrder: "; postOrder(root);
    pauseConsole();
    return 0;
}
