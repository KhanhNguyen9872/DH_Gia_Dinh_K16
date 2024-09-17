document.addEventListener('DOMContentLoaded', () => {
    let products = [
        { name: "Nước Ép Cam", price: 30000 },
        { name: "Trà Sữa", price: 40000 },
        { name: "Cà Phê Đen", price: 20000 },
        { name: "Sinh Tố Bơ", price: 50000 }
    ];
    let carts = [];

    let productList = document.getElementById('product-list');
    let cartList = document.getElementById('cart-list');
    let totalPrice = document.getElementById('total-price');

    const renderCart = () => {
        cartList.innerHTML = '';
        carts.forEach((cart, index) => {
            let { name, price, quantity } = cart;
            let li = document.createElement('li');
            let nameElement = document.createElement('span');
            let priceElement = document.createElement('span');
            let quantityElement = document.createElement('span');
            let delBtn = document.createElement('button');

            li.setAttribute('class', 'cart-item');
            delBtn.setAttribute('class', 'remove-btn');
            delBtn.appendChild(document.createTextNode("Xóa"));
            delBtn.addEventListener('click', (e) => {
                e.preventDefault();
                carts = carts.filter((_, i) => {
                    return i !== index;
                })
                renderCart();
            });

            nameElement.appendChild(document.createTextNode(name));
            priceElement.appendChild(document.createTextNode(price + " VND"));
            quantityElement.appendChild(document.createTextNode("Số lượng: " + quantity));

            li.appendChild(nameElement);
            li.appendChild(priceElement);
            li.appendChild(quantityElement);
            li.appendChild(delBtn);

            cartList.appendChild(li);
        });

        totalPrice.textContent = carts.reduce((total, cart) => total + (+cart.price * +cart.quantity), 0);
    };
    
    const renderProduct = () => {
        productList.innerHTML = '';
        products.forEach((product, index) => {
            let {name, price} = product;

            let li = document.createElement('li');
            let nameElement = document.createElement('span');
            let priceElement = document.createElement('span');
            let addBtn = document.createElement('button');
            
            li.setAttribute('class', 'product');
            
            nameElement.appendChild(document.createTextNode(name));
            priceElement.appendChild(document.createTextNode(price + " VND"));

            addBtn.appendChild(document.createTextNode("Thêm"));
            addBtn.addEventListener('click', (e) => {
                e.preventDefault();

                let { name, price } = products[index];
                
                let cartIndex = carts.findIndex(cart => cart.name === name);

                if (cartIndex == -1) {
                    carts = [...carts, { name, price, quantity: 1 }];
                } else {
                    carts[cartIndex].quantity++;
                }
                
                renderCart();
            });

            li.appendChild(nameElement);
            li.appendChild(priceElement);
            li.appendChild(addBtn);

            productList.appendChild(li);
        });
    }

    renderProduct();
});

