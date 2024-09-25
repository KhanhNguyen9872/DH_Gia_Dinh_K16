document.addEventListener('DOMContentLoaded', () => {
    let users = [];
    let userForm = document.getElementById('userForm');
    let usernameInput = document.getElementById('username');
    let messageElement = document.getElementById('message');
    let ul = document.getElementById('userList');

    const setMessage = (msg, status = -1) => {
        messageElement.textContent = msg;
        if (status == 1) {
            messageElement.style.color = 'green';
        } else if (status == 0) {
            messageElement.style.color = 'red';
        } else {
            messageElement.style.color = 'black';
        };
    };

    const renderUsers = () => {
        ul.innerHTML = '';
        users.forEach((user, index) => {
            let {name} = user;
            let li = document.createElement('li');
            li.setAttribute('class', 'user-item');
            let userNameElement = document.createElement('span');
            let delBtn = document.createElement('button');

            userNameElement.appendChild(document.createTextNode(name));
            delBtn.appendChild(document.createTextNode("Xóa"));
            delBtn.addEventListener('click', (e) => {
                e.preventDefault();
                setMessage(`Đang xóa người dùng "${name}"...`);
                delUserAsync(index);
            })

            li.appendChild(userNameElement);
            li.appendChild(delBtn);

            ul.appendChild(li);
        });
    };

    const addUser = (name) => {
        users = [...users, { name }];
        return `Thêm người dùng "${name}" thành công!`;
    };

    const delUser = (index) => {
        let {name} = users[index];
        users = users.filter((_, i) => i !== index);
        return `Xóa người dùng "${name}" thành công!`;
    };

    const addUserAsync = async(name) => {
        try {
            const add = await addUser(name);
            setMessage(add, 1);
            renderUsers();
        } catch (error) {
            setMessage(error, 0);
        }
    };

    const delUserAsync = async(index) => {
        try {
            const result = await delUser(index);
            setMessage(result, 1);
            renderUsers();
        } catch (error) {
            setMessage(error, 0);
        }
    };

    userForm.addEventListener('submit', (e) => {
        e.preventDefault();
        let name = usernameInput.value;
        setMessage(`Đang thêm người dùng "${name}"...`);
        addUserAsync(name);
    });

    renderUsers();
});