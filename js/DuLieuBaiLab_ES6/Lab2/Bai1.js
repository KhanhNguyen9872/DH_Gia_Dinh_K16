document.addEventListener('DOMContentLoaded', () => {
    let num1Element = document.getElementById('num1');
    let num2Element = document.getElementById('num2');
    let resultElement = document.getElementById('result');

    let calculatorbtn = document.getElementById('calculate-btn');

    calculatorbtn.addEventListener('click', () => {
        let num1 = +num1Element.value;
        let num2 = +num2Element.value;

        const sum=(a, b) => a + b;

        resultElement.textContent = sum(num1, num2);
    });
});