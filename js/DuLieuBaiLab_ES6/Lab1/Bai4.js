let userList = [];

let ul = document.getElementById("user-list");
let userForm = document.getElementById("user-form");

let nameElement = document.getElementById("name");
let emailElement = document.getElementById("email");
let ageElement = document.getElementById("age");

function deleteUser(index) {
    userList = userList.filter((_, i) => {
        return i !== index;
    });
};

function renderUser() {
    ul.innerHTML = '';
    userList.forEach((user, index) => {
        let li = document.createElement('li');

        let {name: name} = user;
        let {email: email} = user;
        let {age: age} = user;

        let editButton = document.createElement('button');
        let delButton = document.createElement('button');

        editButton.appendChild(document.createTextNode("Sửa"));
        delButton.appendChild(document.createTextNode("Xóa"));

        editButton.addEventListener('click', () => {
            let user = userList[index];
            
            nameElement.value = user.name;
            ageElement.value = user.age;
            emailElement.value = user.email;

            deleteUser(index);
        });

        delButton.addEventListener('click', () => {
            deleteUser(index);
            renderUser();
        });

        li.appendChild(document.createTextNode(name));
        li.appendChild(document.createTextNode(email));
        li.appendChild(document.createTextNode(age + ' tuổi'));
        li.appendChild(editButton);
        li.appendChild(delButton);

        ul.appendChild(li);
    });
}

userForm.addEventListener('submit', (event) => {
    event.preventDefault();

    let name = nameElement.value;
    let email = emailElement.value;
    let age = ageElement.value;

    userList = [...userList, { name, email, age }];

    renderUser();
    userForm.reset();
});