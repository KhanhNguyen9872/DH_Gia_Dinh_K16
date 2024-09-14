document.addEventListener('DOMContentLoaded', () => {
    let ul = document.getElementById("product-list");

    let products = [
        {name: "Cóc cóc đác đác", price: 10000, description: 'Vị cóc mác, vị đác thơm ngon'},
        {name: "Trà ô long dâu mai sơn", price: 20000, description: 'Trà ô lông tốt cho sức khỏe'},
        {name: "Trà đào hồng đài", price: 30000, description: 'Trà đào hồng đài'},
        {name: "Trà olong me dứa", price: 40000, description: 'Trà me dứa'}
    ];

    let nameElement = document.querySelector(".name");
    let priceElement = document.querySelector(".price");
    let descriptionElement = document.querySelector(".description");

    products.forEach((product, index) => {
        let {name} = product;
        let li = document.createElement("li");
        li.textContent = name;
        li.addEventListener("click", () => {
            let {name, price, description} = products[index];
            nameElement.textContent = name;
            priceElement.textContent = `Giá: ${price} VNĐ`;
            descriptionElement.textContent = description;
``
        });
        ul.appendChild(li);
    });
});
