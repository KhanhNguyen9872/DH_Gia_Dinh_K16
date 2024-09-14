document.getElementById("user-form").addEventListener('submit', (event) => {
    event.preventDefault();
    let nameElement = document.getElementById("name");
    let emailElement = document.getElementById("email");
    let ageElement = document.getElementById("age");

    let name = nameElement.value;
    let email = emailElement.value;
    let age = ageElement.value;

    let ul = document.getElementById("user-list");

    let li = document.createElement("li");

    let editButton = document.createElement('button');
    let delButton = document.createElement('button');

    editButton.appendChild(document.createTextNode("Sửa"));
    delButton.appendChild(document.createTextNode("Xóa"));

    editButton.addEventListener('click', () => {
        nameElement.value = name;
        ageElement.value = age;
        emailElement.value = email;
        ul.removeChild(li);
    });

    delButton.addEventListener('click', () => {
        ul.removeChild(li);
    });

    li.appendChild(document.createTextNode(name));
    li.appendChild(document.createTextNode(email));
    li.appendChild(document.createTextNode(age + ' tuổi'));
    li.appendChild(editButton);
    li.appendChild(delButton);

    ul.appendChild(li);

    nameElement.value = '';
    ageElement.value = '';
    emailElement.value = '';
});