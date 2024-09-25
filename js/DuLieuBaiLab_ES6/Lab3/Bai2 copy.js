document.addEventListener('DOMContentLoaded', () => {
    let userList = [];

    let userForm = document.getElementById('userForm');
    let nameInput = document.getElementById('name');
    let emailInput = document.getElementById('email');
    let messageElement = document.getElementById('message');
    let ul = document.getElementById('userList');

    const setMessage = (msg, status = -1) => {
        messageElement.textContent = msg;
        if (status == -1) {
            messageElement.style.color = 'black';
        } else if (status == 1) {
            messageElement.style.color = 'green';
        } else if (status == 0) {
            messageElement.style.color = 'red';
        };
    };

    const addUserPromise = (name, email) => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                userList = [...userList, { name, email }];
                resolve("Thêm người dùng thành công!");
            }, 2000);
        })
    };

    const delUserPromise = (index) => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                userList = userList.filter((_, i) => i !== index);
                resolve("Xóa người dùng thành công!");
            }, 2000);
        });
    };

    const loadData = () => {
        setMessage("Đang lấy dữ liệu người dùng...");
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                let users = [
                    { name: "Trần Anh Khoa", email: "khoa@localhost.com" },
                    { name: "Nguyễn Văn Khánh", email: "khanh@localhost.com" }
                ];

                resolve(users);
            }, 2000);
        });
    }

    const renderUsers = () => {
        ul.innerHTML = '';
        userList.forEach((user, index) => {
            let {name, email} = user;
            let li = document.createElement('li');
            li.setAttribute('class', 'user-item');
            let nameElement = document.createElement('span');
            let emailElement = document.createElement('span');
            let deleteBtn = document.createElement('button');

            nameElement.appendChild(document.createTextNode(name));
            emailElement.appendChild(document.createTextNode(email));

            deleteBtn.appendChild(document.createTextNode('Xóa'));
            deleteBtn.setAttribute('class', 'user-item');
            deleteBtn.addEventListener('click', (e) => {
                e.preventDefault();
                setMessage('Đang xóa người dùng...');

                delUserPromise(index).then((resolve) => {
                    setMessage(resolve, 1);
                    renderUsers();
                }).catch((reject) => {
                    setMessage(reject, 0);
                });
            });

            li.appendChild(nameElement);
            li.appendChild(emailElement);
            li.appendChild(deleteBtn);

            ul.appendChild(li);
        });
    };

    userForm.addEventListener('submit', (e) => {
        e.preventDefault();
        setMessage('Đang thêm người dùng...');

        let name = nameInput.value;
        let email = emailInput.value;

        addUserPromise(name, email).then((resolve) => {
            setMessage(resolve, 1);
            renderUsers();
        }).catch((reject) => {
            setMessage(reject, 0);
        });
    });

    loadData().then((resolve) => {
        userList = resolve;
        renderUsers();
        setMessage("");
    }).catch((reject) => {
        setMessage("Không thể lấy dữ liệu người dùng", 0);
    });
});