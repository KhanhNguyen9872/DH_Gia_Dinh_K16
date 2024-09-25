document.addEventListener('DOMContentLoaded', () => {
    let nameInput = document.getElementById('name');
    let emailInput = document.getElementById('email');
    let messageElement = document.getElementById('message');
    let registerForm = document.getElementById('registrationForm');
    
    const submitPromise = () => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                let name = nameInput.value;
                let email = emailInput.value;
                if ((name === '') || (email === '')) {
                    reject("Gửi thất bại!");
                } else {
                    resolve("Gửi thành công!");
                };
            }, 2000);
        });
    };

    registerForm.addEventListener('submit', (e) => {
        e.preventDefault();
        messageElement.textContent = "Đang xử lý...";
        submitPromise().then(resolve => {
            messageElement.textContent = resolve;
            messageElement.style.color = 'green';
        }).catch(reject => {
            messageElement.textContent = reject;
            messageElement.style.color = 'red';
        });
    });
});