document.addEventListener("DOMContentLoaded", () => {
    let obj = {name: 'Nguyễn Văn A', age: 25, email: "nguyenvana@example.com"};

    let {name, age, email} = obj;

    document.querySelector(".name").textContent = `${name}`;
    document.querySelector('.age').textContent = `Age: ${age}`;
    document.querySelector('.email').textContent = `Email: ${email}`;
});
