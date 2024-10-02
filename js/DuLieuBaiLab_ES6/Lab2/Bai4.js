document.addEventListener('DOMContentLoaded', () => {
    let products = [
        { id: 1, name: "Nước Ép Cam", price: 30000 },
        { id: 2, name: "Trà Sữa", price: 40000 },
        { id: 3, name: "Cà Phê Đen", price: 20000 },
        { id: 4, name: "Sinh Tố Bơ", price: 50000 }
    ];
    let carts = [];

    let productList = document.getElementById('product-list');
    let cartList = document.getElementById('cart-list');
    let totalPrice = document.getElementById('total-price');

    const removeCart = (id) => {
        let c = carts.find((p) => p.id === id);
        let { quantity } = c;
        if (quantity > 1) {
            c.quantity--;
        } else {
            carts = carts.filter((_, i) => i !== index);
        };
    }

    const renderCart = () => {
        cartList.innerHTML = '';
        carts.forEach((cart, index) => {
            let { name, price, quantity } = cart;
            let div = document.createElement('div');
            let nameElement = document.createElement('span');
            let priceElement = document.createElement('span');
            let quantityElement = document.createElement('span');
            let delBtn = document.createElement('button');

            div.setAttribute('class', 'cart-item');
            delBtn.setAttribute('class', 'remove-btn');
            delBtn.appendChild(document.createTextNode("Xóa"));
            delBtn.addEventListener('click', (e) => {
                e.preventDefault();
                removeCart();
                renderCart();
            });

            nameElement.appendChild(document.createTextNode(name));
            priceElement.appendChild(document.createTextNode(price + " VND"));
            quantityElement.appendChild(document.createTextNode("Số lượng: " + quantity));

            div.appendChild(nameElement);
            div.appendChild(priceElement);
            div.appendChild(quantityElement);
            div.appendChild(delBtn);

            cartList.appendChild(div);
        });

        totalPrice.textContent = carts.reduce((total, cart) => total + (+cart.price * +cart.quantity), 0);
    };
    
    const renderProduct = () => {
        productList.innerHTML = '';
        products.forEach((product, index) => {
            let {id, name, price} = product;

            let div = document.createElement('div');
            let nameElement = document.createElement('span');
            let priceElement = document.createElement('span');
            let addBtn = document.createElement('button');
            
            div.setAttribute('class', 'product');
            
            nameElement.appendChild(document.createTextNode(name));
            priceElement.appendChild(document.createTextNode(price + " VND"));

            addBtn.appendChild(document.createTextNode("Thêm"));
            addBtn.addEventListener('click', (e) => {
                e.preventDefault();

                let p = products[index];
                
                let cart = carts.find(cart => cart.id === id);

                if (cart) {
                    cart.quantity++;
                } else {
                    carts = [...carts, { ...p, quantity: 1 }];
                }
                
                renderCart();
            });

            div.appendChild(nameElement);
            div.appendChild(priceElement);
            div.appendChild(addBtn);

            productList.appendChild(div);
        });
    }

    renderProduct();
});

