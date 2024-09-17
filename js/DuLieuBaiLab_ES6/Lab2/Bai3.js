document.addEventListener('DOMContentLoaded', () => {
    let tasks = [
        { name: "Bài tập ES6", complete: false },
        { name: "Bài tập Vuejs", complete: false },
        { name: "Bài tập Nodejs", complete: false },
        { name: "Bài tập PHP", complete: false }
    ];

    let ul = document.getElementById('task-list');
    let taskInput = document.getElementById('task-input');

    const deleteTask = (index) => {
        tasks = tasks.filter((_, i) => i !== index);
    };

    const renderTasks = (t = tasks) => {
        ul.innerHTML = '';
        t.forEach((task, index) => {
            let {name, complete} = task;

            let li = document.createElement('li');
            let nameElement = document.createElement('element');
            let completeBtn = document.createElement('button');
            let delBtn = document.createElement('button');
            
            nameElement.appendChild(document.createTextNode(name));

            if (complete) {
                nameElement.setAttribute('class', "task-name completed");
            } else {
                nameElement.setAttribute('class', "task-name");
            }
            
            completeBtn.setAttribute("class","complete-btn");
            delBtn.setAttribute("class","delete-btn");
            completeBtn.appendChild(document.createTextNode('Hoàn thành'));
            delBtn.appendChild(document.createTextNode('Xóa'));

            completeBtn.addEventListener('click', () => {
                tasks[index].complete = true;
                renderTasks();
            })

            delBtn.addEventListener('click', () => {
                deleteTask(index);
                renderTasks();
            });
            
            li.appendChild(nameElement);
            li.appendChild(completeBtn);
            li.appendChild(delBtn);
            ul.appendChild(li);
        });
    };

    let addBtn = document.getElementById('add-btn');
    addBtn.addEventListener('click', () => {
        tasks = [...tasks, {name: taskInput.value, complete: false}];
        renderTasks();
    })

    renderTasks();
});