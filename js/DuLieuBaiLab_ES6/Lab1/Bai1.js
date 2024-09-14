
document.getElementById("registrationForm").addEventListener("submit", (event) => {
    event.preventDefault();
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const passwd = document.getElementById("password").value;
    const repasswd = document.getElementById("confirmPassword").value;
    console.log(name + " " + email + ' ' + passwd + ' ' + repasswd);

    const msg = document.getElementById("message");
    if (passwd === repasswd) {
        msg.textContent = "Đăng ký thành công";
        msg.style.color = "green";
    } else {
        msg.textContent = "Mật khẩu không khớp. Vui lòng thử lại!";
        msg.style.color = "red";
    }
});