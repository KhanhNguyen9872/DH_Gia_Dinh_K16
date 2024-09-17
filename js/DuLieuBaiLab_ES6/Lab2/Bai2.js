document.addEventListener('DOMContentLoaded', () => {
    let productList = [
        { name: "Cam", price: 100000 },
        { name: "Táo", price: 200000 },
        { name: "Bưởi", price: 150000 },
        { name: "Đào", price: 50000 },
        { name: "Mận", price: 250000 }
    ];

    let ul = document.getElementById('product-list');

    const renderProduct = (pList = productList) => {
        ul.innerHTML = '';
        pList.forEach((product, index) => {
            let li = document.createElement('li');

            let {name: name, price: price} = product;

            let boldName = document.createElement('strong');
            boldName.appendChild(document.createTextNode(name))

            li.appendChild(boldName);
            li.appendChild(document.createTextNode(price + " VND"));
            ul.appendChild(li);
        });
    }

    renderProduct();

    const filterProducts = () => {
        let {value} = filterInput;
        value = parseFloat(value);

        let newProductList = isNaN(value) ? productList : productList.filter((product) => value >= product.price);
        return newProductList;
    }

    let isAscending = true;
    const sort = (productList) => {
        return productList.sort((a, b) => isAscending ? a.price - b.price : b.price - a.price);
    };

    let sortBtn = document.getElementById('sort-btn');
    let filterInput = document.getElementById('filter-price');

    sortBtn.addEventListener('click', (e) => {
        isAscending = !isAscending;
        renderProduct(sort(filterProducts()));
        sortBtn.textContent = isAscending ? "Giảm dần" : "Tăng dần";
    });

    filterInput.addEventListener('input', (e) => {
        renderProduct(filterProducts());
    });
});