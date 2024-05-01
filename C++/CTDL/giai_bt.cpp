#include<iostream>
using namespace std;

/*
1. Cho mảng số nguyên a[] có số phần tử n = 8 như sau, a[8] = {1,3,7,11,23,25,30,44}
a. Trình bày ý tưởng của giải thuật tìm kiếm nhị phân.
b. Vẽ lưu đồ giải thuật giải thuật tìm kiếm nhị phân.
c. Viết hàm con tìm kiếm nhị phân cho mảng a[].

a)
    Sắp xếp lại mảng theo hướng tăng dần.
    Tìm ra vị trí trung tâm của mảng.
    Thu hẹp phạm vi tìm kiếm bằng cách:
        Nếu giá trị cần tìm lớn hơn phần tử ở giữa, ta chỉ tìm kiếm trong nửa phía sau của mảng.
        Nếu giá trị cần tìm nhỏ hơn phần tử ở giữa, ta chỉ tìm kiếm trong nửa phía trước của mảng.
        Nếu giá trị cần tìm bằng phần tử ở giữa, ta đã tìm thấy nó và kết thúc quá trình tìm kiếm.
    Lặp lại quá trình cho đến khi tìm thấy hoặc không còn phần tử để xem xét.

b) giai_bt.drawio (bai 1)

c) function binary_search()
*/

void binary_search(int a[], int n, int target, int *answer) {
    int index = 0, mid = 0;
    *answer = -1;
    while (index < n) {
        mid = index + (n - index) / 2;
        if (a[mid] == target) {
            *answer = mid;
            return;
        } else if (a[mid] < target) {
            index = mid + 1;
        } else {
            n = mid - 1;
        };
    };
    // không tìm thấy giá trị target trong mảng A
    return;
};



/*
2. Cho mảng số nguyên a[] có số phần tử n = 8 như sau, a[8] = {1,3,7,11,23,25,30,44}
a. Trình bày ý tưởng của giải thuật tìm kiếm tuần tự.
b. Vẽ lưu đồ giải thuật giải thuật tìm kiếm tuần tự.
c. Viết hàm con tìm kiếm nhị phân cho mảng a[].

a)
    Duyệt từng phần tử trong mảng từ trái qua phải.
    Nếu có giá trị cần tìm trong mảng, thì trả về vị trí của phần tử đó.
    Nếu đã duyệt toàn bộ, thì trả về -1 bởi vì không có phần tử cần tìm trong mảng.

b) giai_bt.drawio (bai 2)

c) function timKiemTuanTu()
*/

void timKiemTuanTu(int a[], int n, int target, int *answer) {
    int i;
    *answer = -1;
    for(i = 0; i < n; i++) {
        if (a[i] == target) {
            *answer = i;
            return;
        };
    };
    return;
};



/*
3. Cho mảng số nguyên a[] có số phần tử n = 8 như sau, a[8] = {1,3,7,11,23,25,30,44}
a. Trình bày ý tưởng của giải thuật tìm kiếm tuần tự có lính canh.
b. Vẽ lưu đồ giải thuật giải thuật tìm kiếm tuần tự có lính canh.
c. Viết hàm con tìm kiếm nhị phân cho mảng a[].

a)
    Tạo 1 mảng mới bao gồm các phần tử mảng đầu vào kèm theo giá trị cần tìm ở cuối mảng.
    Duyệt từng phần tử cho tới khi tìm thấy giá trị cần tìm trong mảng mới, trả về vị trí và kết thúc hàm.
    Nếu tới phần tử cuối cùng của mảng, có nghĩa không tìm thấy giá trị cần tìm nào trong mảng.

b) giai_bt.drawio (bai 3)

c) function linhCanh()
*/

void linhCanh(int a[], int n, int target, int *answer) {
    int *newArray = new int[n + 1];
    int i;
    *answer = -1;
    for(i = 0; i < n; i++) {
        newArray[i] = a[i];
    };
    newArray[n] = target;

    for(i = 0; i <= n; i++) {
        if(target == newArray[i]) {
            if(i == n) {
                return;
            } else {
                *answer = i;
                return;
            };
        };
    };
    return;
};



/*
4. Cho mảng số nguyên a[] có số lượng phần tử n nhập từ bàn phím:
a. Viết hàm con nhập ngẫu nhiên mảng có n phần tử, gán giá trị ngẫu nhiên trong khoảng -99 đến 99.
b. Trình bày ý tưởng, lưu đồ giải thuật và viết hàm sắp xếp mảng bằng giải thuật selection.
c. Trình bày ý tưởng, lưu đồ giải thuật và viết hàm sắp xếp mảng bằng giải thuật interchange.
d. Trình bày ý tưởng, lưu đồ giải thuật và viết hàm sắp xếp mảng bằng giải thuật bubble.
e. Trình bày ý tưởng, lưu đồ giải thuật và viết hàm sắp xếp mảng bằng giải thuật insertion.
f. Trình bày ý tưởng và viết hàm sắp xếp mảng bằng giải thuật quick sort.
g. Trình bày ý tưởng và viết hàm sắp xếp mảng bằng giải thuật merge sort.

a) hàm nhapNgauNhien()

b) 
Ý tưởng:
    Lặp qua từng phần tử của mảng.
    Tại mỗi vòng lặp, tìm phần tử nhỏ nhất trong đoạn chưa sắp xếp và đổi chỗ nó với phần tử đầu tiên của đoạn chưa sắp xếp.
Lưu đồ: giai_bt.drawio (bai 4b)
Hàm: function selectionSort()

c)
Ý tưởng:
    Cho 2 vòng lặp i và j. 
    Vòng lặp i sẽ chạy từ đầu phần tử tới phần tử kế cuối trong mảng. 
    Vòng lặp j sẽ nằm trong vòng lặp i và chạy từ vị trí i + 1 tới vị trí cuối mảng.
    Tại mỗi vòng lặp j, lần lượt tìm phần tử nhỏ hơn phần tử tại vị trí i, nếu có thì sẽ hoán đổi phần tử tại vị trí i vói phần tử tại vị trí j
Lưu đồ: giai_bt.drawio (bai 4c)
Hàm: function interchangeSort()

d)
Ý tưởng:
    Cho 2 vòng lặp i và j
    Vòng lặp i chạy từ đầu tới cuối mảng.
    Vòng lặp j chạy từ đầu tới kế cuối mảng.
    Tại mỗi vòng lặp j, nếu phần tử j lớn hơn phần tử j + 1 thì cả 2 sẽ hoán đổi vị trí phần tử cho nhau.
Lưu đồ: giai_bt.drawio (bai 4d)
Hàm: function bubbleSort()

e)
Ý tưởng:
    Duyệt qua từng phần tử của mảng, từ phần tử thứ 2 cho tới phần tử cuối của mảng.
    Tại mỗi vòng lặp, so sánh phần tử hiện tại với tất cả các phần tử đứng sau nó. Nếu có phần tử nào nhỏ hơn, ta hoán đổi chỗ phần tử hiện tại với phần tử nhỏ hơn đó.
Lưu đồ: giai_bt.drawio (bai 4e)
Hàm: function insertionSort()

f)
Ý tưởng:
    1. Chọn phần tử chốt.
    2. Khai báo 2 biến con trỏ để trỏ để duyệt 2 phía của phần tử chốt.
    3. Biến bên trái trỏ đến từng phần tử mảng con bên trái của phần tử chốt.
    4. Biến bên phải trỏ đến từng phần tử mảng con bên phải của phần tử chốt.
    5. Khi biến bên trái nhỏ hơn phần tử chốt thì di chuyển sang phải.
    6. Khi biến bên phải nhỏ hơn phần tử chốt thì di chuyển sang trái.
    7. Nếu không xảy ra trưởng hợp 5 và 6 thì tráo đổi giá trị 2 biến trái và phải.
    8. Nếu trái lơn hơn phải thì đây là giá trị chốt mới.
Lưu đồ: giai_bt.drawio (bai 4f)
Hàm: function quickSort()

g)
Ý tưởng:
    Chia mảng thành hai nửa bằng cách chọn phần tử giữa làm điểm chia. Dùng đệ quy liên tục chia nửa cho tới khi không thể chia được nữa.
    Gộp các phần tử đã chia lại thành một mảng đã sắp xếp. 
Lưu đồ: giai_bt.drawio (bai 4g)
Hàm: function mergeSort()
*/

void nhapNgauNhien(int a[], int n) {
    int i;
    for(i = 0; i < n; i++) {
        a[i] = rand() % 199 - 99;
    };
    return;
};

void selectionSort(int a[], int n) {
    int i, j, min;
    for(i = 0; i < n; i++) {
        min = i;
        for(j = (i + 1); j < n; j++) {
            if (a[min] > a[j]) {
                min = j;
            };
        };
        swap(a[i], a[min]);
    };
    return;
};

void interchangeSort(int a[], int n) {
    int i, j;
    for(i = 0; i < n - 1; i++) {
        for(j = i + 1; j < n; j++) {
            if (a[i] > a[j]) {
                swap(a[i], a[j]);
            };
        };
    };
    return;
};

void bubbleSort(int a[], int n) {
    int i, j;
    for(i = 0; i < n; i++) {
        for(j = 0; j < n - 1; j++) {
            if (a[j] > a[j + 1]) {
                swap(a[j], a[j + 1]);
            };
        };
    };
    return;
};

void insertionSort(int a[], int n) {
    int i, tmp, j;
    for(i = 1; i < n; i++) {
        tmp = a[i];
        j = i - 1;
        while((j >= 0) && (a[j] > tmp)) {
            a[j + 1] = a[j];
            j = j - 1;
        };
        a[j + 1] = tmp;
    };
    return;
};

void quicksort(int a[], int left, int right) {
	int mid = (left + right) / 2;
	int i = left, j = right; 
	while (i <= j) {
		while (a[i] < a[mid])
			i++;
		while (a[j] > a[mid])
			j--;
		if (i <= j) {
			swap(a[i], a[j]);
			i++;
			j--;
		};
	};
	if (i < right){
		quicksort(a, i, right);
	};
	if (j > left) {
		quicksort(a, left, j);
	};
};

void merge(int a[], int left, int mid, int right) {
    int i, j, k;
    int n1 = mid - left + 1;
    int n2 = right - mid;

    int L[n1], R[n2];

    for (i = 0; i < n1; i++) {
        L[i] = a[left + i];
    };
    for (j = 0; j < n2; j++) {
        R[j] = a[mid + 1 + j];
    };

    i = 0;
    j = 0;
    k = left;
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            a[k] = L[i];
            i++;
        } else {
            a[k] = R[j];
            j++;
        };
        k++;
    };

    while (i < n1) {
        a[k] = L[i];
        i++;
        k++;
    };

    while (j < n2) {
        a[k] = R[j];
        j++;
        k++;
    };
};

void mergeSort(int a[], int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;

        mergeSort(a, left, mid);
        mergeSort(a, mid + 1, right);

        merge(a, left, mid, right);
    };
};


/*
5. Cho mảng số nguyên a[] có số phần tử n = 6 như sau, a[6] = {3,1,5,2,9,7}. 
Cho biết từng kết quả của mảng sau n lần chạy khi sắp xếp mảng bằng giải thuật selection.

Mảng ban đầu: {3, 1, 5, 2, 9, 7}
Kết quả:
1. {1, 3, 5, 2, 9, 7}
2. {1, 2, 3, 5, 9, 7}
3. {1, 2, 3, 5, 9, 7}
4. {1, 2, 3, 5, 7, 9}
5. {1, 2, 3, 5, 7, 9}
6. {1, 2, 3, 5, 7, 9}
*/



/*
6. Cho mảng số nguyên a[] có số phần tử n = 6 như sau, a[6] = {3,1,5,2,9,7}. 
Cho biết từng kết quả của mảng sau n lần chạy khi sắp xếp mảng bằng giải thuật interchange.

Mảng ban đầu: {3, 1, 5, 2, 9, 7}
Kết quả:
1. {1, 3, 5, 2, 9, 7}
2. {1, 2, 3, 5, 9, 7}
3. {1, 2, 3, 5, 9, 7}
4. {1, 2, 3, 5, 7, 9}
5. {1, 2, 3, 5, 7, 9}
6. {1, 2, 3, 5, 7, 9}
*/



/*
7. Cho mảng số nguyên a[] có số phần tử n = 6 như sau, a[6] = {3,1,5,2,9,7}. 
Cho biết từng kết quả của mảng sau n lần chạy khi sắp xếp mảng bằng giải thuật bubble.

Mảng ban đầu: {3, 1, 5, 2, 9, 7}
Kết quả:
1. {1, 3, 2, 5, 7, 9}
2. {1, 2, 3, 5, 7, 9}
3. {1, 2, 3, 5, 7, 9}
4. {1, 2, 3, 5, 7, 9}
5. {1, 2, 3, 5, 7, 9}
6. {1, 2, 3, 5, 7, 9}
*/



/*
8. Cho mảng số nguyên a[] có số phần tử n = 6 như sau, a[6] = {3,1,5,2,9,7}. 
Cho biết từng kết quả của mảng sau n lần chạy khi sắp xếp mảng bằng giải thuật insertion.

Mảng ban đầu: {3, 1, 5, 2, 9, 7}
Kết quả:
1. {1, 3, 5, 2, 9, 7}
2. {1, 3, 5, 2, 9, 7}
3. {1, 2, 3, 5, 9, 7}
4. {1, 2, 3, 5, 9, 7}
5. {1, 2, 3, 5, 7, 9}
*/



/*
9. Cho một Node trong cây nhị phân tìm kiếm có cấu trúc như sau:
struct Node{
	int key;
	Node* left;
	Node* right;
};

a. Trình bày đặc điểm của cây nhị phân tìm kiếm
b. Viết hàm con tạo một node mới của cây nhị phân tìm kiếm
c. Viết hàm con thêm một node vào cây nhị phân tìm kiếm
d. Viết hàm duyệt cây bằng phương pháp duyệt trước
e. Viết hàm duyệt cây bằng phương pháp duyệt sau
f. Viết hàm duyệt cây bằng phương pháp duyệt giữa
g. Viết hàm xóa 1 node trong cây nhị phân tìm kiếm
h. Viết hàm tìm kiếm 1 node trong cây nhị phân tìm kiếm
k. Viết hàm đếm số node trong cây nhị phân tìm kiếm
m. Viết hàm quay trái/phải cây nhị phân tìm kiếm

a)
    Cây nhị phân tìm kiếm là một cấu trúc dữ liệu cây mà mỗi nút có tối đa hai nút con trái và phải và mỗi nút trong cây có giá trị duy nhất.

b) Hàm newNode()

c) Hàm addNode()

d) Hàm preOrder()

e) Hàm postOrder()

f) Hàm inOrder()

g) Hàm delNode()

h) Hàm searchNode()

k) Hàm countNode()

m) Hàm leftTurn() / rightTurn()
*/

struct Node{
	int key;
	Node* left;
	Node* right;
};

Node *newNode(int data) {
    Node *newRoot = new Node;
    newRoot->key = data;
    newRoot->left = NULL;
    newRoot->right = NULL;
    return newRoot;
};

void addNode(Node *&root,int data) {
    if(root==NULL) {
        root = newNode(data);
    } else {
        if(root->key > data) {
            addNode(root->left,data);
        };
        if(root->key < data) {
            addNode(root->right,data);
        };
    };
    return;
};

void preOrder(Node *root) {
    if(root != NULL) {
        cout << " " << root->key;
        preOrder(root->left);
        preOrder(root->right);
    };
};

void inOrder(Node *root) {
    if(root != NULL) {
        inOrder(root->left);
        cout << " " << root->key;
        inOrder(root->right);
    };
};

void postOrder(Node *root) {
    if(root != NULL) {
        postOrder(root->left);
        postOrder(root->right);
        cout << " " << root->key;
    };
};

Node *searchNode(Node* root, int data) {
    if ((root == NULL) || (root->key == data)) {
        return root;
    };

    if (data < root->key) {
        return searchNode(root->left, data);
    };
    return searchNode(root->right, data);
};

int countNode(Node* root) {
    if (root == NULL) {
        return 0;
    };
    return 1 + countNode(root->left) + countNode(root->right);
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
};

void leftTurn(Node *&root) {
    Node *rootBanDau = root; // Lưu lại địa chỉ gốc ban đầu
    root = root->right; // gốc mới bên trái

    if (root->left == NULL) {
        rootBanDau->right = NULL;
    } else {
        rootBanDau->right = root->left;
    };
    root->left = rootBanDau;
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


/*
10. Tạo và lần lượt thêm vào cây nhị phân tìm kiếm các giá trị như sau: 8, 6, 3, 7, 4, 22, 9, 11
a. Vẽ cây nhị phân tìm kiếm
b. Vẽ cây nhị phân tìm kiếm sau khi xóa phần tử gốc
c. Vẽ cây nhị phân tìm kiếm sau khi thực hiện quay trái/phải cây

a)
         8
       /   \ 
      6     22
    /  \   /
   3    7 9
    \      \ 
      4     11

b)
         11
       /   \ 
      6     22
    /  \   /
   3    7 9
    \      
      4    

c)
Quay trái cây:
          8
       /    \ 
      22      6
            /   \   
           9     3
          /     / \ 
         11    7   4

Quay phải cây:
          6
        /   \
       3     8
            / \
          7    22
             /    \
            9      11
                   /
                  4


*/



/*
11. Cho cây nhị phân sau

        40
       /  \ 
      5    45
       \     \ 
        35    56
       /     /
     15     48
    /  \   /  \
   13  16 47  49

a. Trình bày kết quả duyệt cây bằng phương pháp duyệt trước
b. Trình bày kết quả duyệt cây bằng phương pháp duyệt giữa
c. Trình bày kết quả duyệt cây bằng phương pháp duyệt sau
d. Trình bày kết quả cân bằng cây
e. Trình bày kết quả quay trái cây
f. Trình bày kết quả quay phải cây

a) Duyệt trước (preOrder): 40, 5, 35, 15, 13, 16, 45, 56, 48, 47, 49
b) Duyệt giữa (inOrder): 5, 13, 15, 16, 35, 40, 45, 47, 48, 49, 56
c) Duyệt sau (postOrder): 13, 16, 15, 35, 5, 47, 49, 48, 56, 45, 40
d) Cân bằng cây: 
e) Quay trái cây: 
f) Quay phải cây: 
*/



/*
12. Cho ngăn xếp được xây dựng bằng mảng một chiều, có n phần tử.
a. Trình bày nguyên lý hoạt động của ngăn xếp
b. Viết hàm push thêm 1 phần tử vào ngăn xếp
c. Viết hàm pop lấy 1  phần tử khỏi ngăn xếp

a) 
    Nguyên lý hoạt động của ngăn xếp là khi thêm một phần tử vào hàng đợi, phần tử này sẽ được đặt ở cuối hàng đợi. Điều này có nghĩa là phần tử mới thêm vào sẽ là phần tử đầu tiên được lấy ra.

b) hàm push()

c) hàm pop()
*/

void push(int stack[], int value) {
    if (locationStack > sizeStack - 1) {
        return;
    };
    stack[locationStack] = value;
    locationStack++;
    return;
};

void pop(int stack[]) {
    if (locationStack < 0) {
        cout << "\nNULL";
        return;
    };
    cout << stack[locationStack];
    locationStack--;
    return;
};


/*
13. Cho hàng đợi được xây dựng bằng mảng một chiều, có n phần tử.
a. Trình bày nguyên lý hoạt động của hàng đợi
b. Viết hàm enqueue thêm 1 phần tử vào hang đợi
c. Viết hàm dequeue lấy 1  phần tử khỏi hang đợi

a) 
    Nguyên lý hoạt động của ngăn xếp là khi thêm một phần tử vào hàng đợi, phần tử này sẽ được đặt ở cuối hàng đợi. Điều này có nghĩa là phần tử mới thêm vào sẽ là phần tử cuối cùng được lấy ra.

b) Hàm enqueue()

c) Hàm dequeue()
*/

void enqueue(int queue[], int value) {
    if (soPhanTuTrongQueue >= maxQueue) {
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



/*
14. Danh sách liên kết
Cho một Node trong danh sách liên kết đơn có cấu trúc như sau:
struct Node{
	int key;
	Node* next;
};

a. Trình bày đặc điểm của cấu trúc danh sách liên kết, so sánh với cấu trúc mảng
b. Viết hàm tạo 1 node mới trong danh sách liên kết đơn
c. Viết hàm thêm 1 node mới vào (đầu/cuối) trong danh sách liên kết đơn
d. Viết hàm xóa 1 node (đầu/cuối) trong danh sách liên kết đơn
e. Viết hàm tìm kiếm 1 node trong danh sách liên kết đơn
f. Viết hàm xóa 1 node có giá trị = x trong danh sách liên kết đơn
g. Viết hàm thêm 1 node sau node có giá trị = x trong danh sách liên kết đơn

a)
    Đặc điểm: Danh sách liên kết là một cấu trúc dữ liệu mà mỗi phần tử trong danh sách được liên kết với phần tử tiếp theo thông qua một con trỏ
    So sánh: Danh sách liên kết tiêu tốn ít bộ nhớ và linh hoạt hơn, trong khi mảng có tốc độ truy cập nhanh hơn và dễ dàng để thực hiện các tính toán về chỉ số.

b) Hàm newNode()

c) Hàm addHead() / addLast()

d) Hàm delHead() / delLast()

e) Hàm searchNode()

f) Hàm delNode()

g) Hàm addNodeAfter()
*/

struct Node{
	int key;
	Node* next;
};

Node *newNode(int data) {
    Node *temp = new Node;
    temp->key = data;
    temp->next = NULL;
    return temp;
};

void addHead(Node *&pHead, int data) {
    Node *temp = newNode(data);
    if(pHead == NULL) {
        pHead = temp;
    } else {
        temp->next = pHead;
        pHead = temp;
    };
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

void delHead(Node *&pHead) {
    pHead = pHead->next;
    return;
};

void delLast(Node *&pHead) {
    Node *tmp = pHead;
    while(tmp->next->next != NULL) {
        tmp = tmp->next;
    };
    tmp->next = NULL;
    return;
};

Node* searchNode(Node* root, int data) {
    Node* current = root;
    while (current != NULL) {
        if (current->key == data) {
            return current;
        };
        current = current->next;
    };
    return NULL;
};

void delNode(Node* &root, int data) {
    Node* current = root;
    Node* prev = NULL;

    // Duyệt qua danh sách liên kết đơn để tìm nút chứa giá trị cần xóa
    while (current != NULL && current->key != data) {
        prev = current;
        current = current->next;
    };

    if (current == NULL) {
        return;
    };

    // Nếu nút cần xóa là nút đầu tiên của danh sách
    if (prev == NULL) {
        root = current->next;
    } else {
        // Nếu nút cần xóa không phải là nút đầu tiên của danh sách
        prev->next = current->next;
    };
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

void addNodeAfter(Node *pHead, int x) {
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