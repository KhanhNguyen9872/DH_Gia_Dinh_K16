document.addEventListener('DOMContentLoaded', () => {
    let tasks = [
        { name: "Học JavaScript", complete: false },
        { name: "Làm bài tập về nhà", complete: true }
    ];

    let todoForm = document.getElementById('todoForm');
    let taskInput = document.getElementById('task');
    let messageElement = document.getElementById('message');
    let ul = document.getElementById('todoList');

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

    const addTaskPromise = () => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                let name = taskInput.value;
                let complete = false;
                tasks = [...tasks, { name, complete }];

                resolve(`Thêm công việc "${name}" thành công!`);
            }, 2000);
        });
    };

    const setTaskCompletePromise = (index) => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                let {name} = tasks[index];
                tasks[index].complete = true;
                resolve(`Công việc "${name}" đã hoàn thành!`);
            }, 2000);
        });
    };

    const delTaskPromise = (index) => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                let {name} = tasks[index];
                tasks = tasks.filter((_, i) => i !== index);
                resolve(`Xóa công việc "${name}" thành công!`);
            }, 2000);
        });
    };

    const renderUsers = () => {
        ul.innerHTML = '';
        tasks.forEach((task, index) => {
            let li = document.createElement('li');
            li.setAttribute('class', 'todo-item');
            
            let {name, complete} = task;

            let taskNameElement = document.createElement('span');
            taskNameElement.appendChild(document.createTextNode(name));

            if (complete) {
                taskNameElement.setAttribute('class', 'todo-item completed');
            }

            let completeBtn = document.createElement('button');
            let delBtn = document.createElement('button');

            completeBtn.appendChild(document.createTextNode('Hoàn thành'));
            delBtn.appendChild(document.createTextNode('Xóa'));

            completeBtn.addEventListener('click', (e) => {
                e.preventDefault();
                setMessage("Đang gửi yêu cầu hoàn thành...");
                setTaskCompletePromise(index).then((resolve) => {
                    setMessage(resolve, 1);
                    renderUsers();
                }).catch((reject) => {
                    setMessage(reject, 0);
                });
            });
            
            delBtn.addEventListener('click', (e) => {
                e.preventDefault();
                setMessage("Đang gửi yêu cầu xóa...");
                delTaskPromise(index).then((resolve) => {
                    setMessage(resolve, 1);
                    renderUsers();
                }).catch((reject) => {
                    setMessage(reject, 0);
                });
            });

            li.appendChild(taskNameElement);
            li.appendChild(completeBtn);
            li.appendChild(delBtn);

            ul.appendChild(li);
        });
    };

    todoForm.addEventListener('submit', (e) => {
        e.preventDefault();
        setMessage("Đang thêm công việc...");
        addTaskPromise().then((resolve) => {
            setMessage(resolve, 1);
            renderUsers();
        }).catch((reject) => {
            setMessage(reject, 0);
        });
    });

    renderUsers();
});