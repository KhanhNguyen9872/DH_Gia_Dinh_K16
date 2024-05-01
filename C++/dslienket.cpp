/******************************************************************************
Xây dựng những giải thuật trên cây nhị phân thực hiện những thao tác sau đây
•	Thêm phần tử (khóa)
•	Tìm kiếm phần tử (khóa)
•	Sắp xếp
•	Duyệt cây
•	Xóa phần tử (khóa)
•	Quay cây
*******************************************************************************/

#include <iostream>
using namespace std;
struct Node{
	int key;
	Node *left;
	Node *right;
};
Node *newNode(int data);//hàm tạo 1 node mới
void addNode(Node *&root,int data);
void preOrder(Node *root);
void inOrder(Node *root);
void postOrder(Node *root);
void visit(Node *root);
void rightTurn(Node *&root);
void leftTurn(Node *&root);
Node* deleteNode(Node* root, int data);
int main()
{
    Node *root = NULL;
    addNode(root,8);
    addNode(root,1);
    addNode(root,9);
    addNode(root,7);
    addNode(root,5);
    addNode(root,6);
    addNode(root,4);
    addNode(root,3);
    addNode(root,2);
    addNode(root,0);
    cout<<"\npreOder";
    preOrder(root); //kết quả = 8-1-0-7-5-4-3-2-6-9
    cout<<"\ninOrder";
    inOrder(root); //kết quả = 0-1-2-3-4-5-6-7-8-9
    cout<<"\npostOrder";
    postOrder(root); //kết quả = 0-2-3-4-6-5-7-1-9-8
    cout << "\n";
    // deleteNode(root, 0);
    // preOrder(root);

    cout << "\nxoay trai cay";
    leftTurn(root);
    cout<<"\npreOder";
    preOrder(root); //kết quả = 8-1-0-7-5-4-3-2-6-9
    cout<<"\ninOrder";
    inOrder(root); //kết quả = 0-1-2-3-4-5-6-7-8-9
    cout<<"\npostOrder";
    postOrder(root); //kết quả = 0-2-3-4-6-5-7-1-9-8
    cout << "\n";

    cin.get();
    cin.get();
    return 0;
}
Node *newNode(int data)
{
    Node *temp = new Node;
    temp->key = data;
    temp->left = NULL;
    temp->right = NULL;
    return temp;
}
void addNode(Node *&root,int data)
{
    if(root==NULL)
        root = newNode(data);
    else
    {
        if(root->key > data)
            addNode(root->left,data);
        if(root->key < data)
            addNode(root->right,data);
    }
}
void rightTurn(Node *&root) {
    Node *rootBanDau = root; // Lưu lại địa chỉ gốc ban đầu
    root = root->left; // gốc mới bên trái

    if (root->right == NULL) {
        rootBanDau->left = NULL;
    } else {
        rootBanDau->left = root->right;
    }
    root->right = rootBanDau;
};

void leftTurn(Node *&root) {
    Node *rootBanDau = root; // Lưu lại địa chỉ gốc ban đầu
    root = root->right; // gốc mới bên trái

    if (root->left == NULL) {
        rootBanDau->right = NULL;
    } else {
        rootBanDau->right = root->left;
    }
    root->left = rootBanDau;

};

void preOrder(Node *root)
{
    if(root!=NULL)
    {
        visit(root);
        preOrder(root->left);
        preOrder(root->right);
    }
}
void inOrder(Node *root)
{
    if(root!=NULL)
    {
        inOrder(root->left);
        visit(root);
        inOrder(root->right);
    }
}
void postOrder(Node *root)
{
    if(root!=NULL)
    {
        postOrder(root->left);
        postOrder(root->right);
        visit(root);
    }
}
void visit(Node *root)
{
    cout<<" "<<root->key;
}
// Function to find the minimum value node in a BST
Node* findMin(Node* root) {
    while (root->left != nullptr) {
        root = root->left;
    }
    return root;
}

// Function to delete a node with the given key from the BST
Node* deleteNode(Node* root, int data) {
    if (root == nullptr) return root; // Base case: empty tree

    if (data < root->key) {
        root->left = deleteNode(root->left, data); // Recurse on the left subtree
    } else if (data > root->key) {
        root->right = deleteNode(root->right, data); // Recurse on the right subtree
    } else {
        // Node with the key to be deleted found
        if (root->left == nullptr) {
            Node* temp = root->right;
            delete root;
            return temp;
        } else if (root->right == nullptr) {
            Node* temp = root->left;
            delete root;
            return temp;
        }
        // Node with two children: Get the inorder successor (smallest in the right subtree)
        Node* temp = findMin(root->right);
        root->key = temp->key;
        root->right = deleteNode(root->right, temp->key);
    }
    return root;
}
