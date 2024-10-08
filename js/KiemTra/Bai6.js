
// data
let items = [];

// element
const priceFilterElement = document.getElementById('priceFilter');
const productTableElement = document.getElementById('productTable');
const totalMoneyElement = document.getElementById('total');

// function
const calcSingleItem = (index = -1) => {
    if (index == -1) return;
    items[index].total = items[index].quantity * items[index].price;
}

const renderItems = (p = items) => {
    productTableElement.innerHTML = '';
    p.forEach((item) => {
        let { id, checked, name, price, quantity, total } = item;
        
        let row = productTableElement.insertRow();

        let checkBoxElement = row.insertCell(0);
        let checkBoxInput = document.createElement('input');
        checkBoxInput.type = 'checkbox';
        checkBoxInput.checked = checked;
        checkBoxInput.addEventListener('click', (e) => {
            e.preventDefault();

            setCheckBox(id, !checked);
        });
        checkBoxElement.appendChild(checkBoxInput);

        let nameElement = row.insertCell(1);
        nameElement.appendChild(document.createTextNode(name));

        let priceElement = row.insertCell(2);
        priceElement.appendChild(document.createTextNode(price));

        let quantityElement = row.insertCell(3);
        let quantityInput = document.createElement('input');
        quantityInput.type = 'number';
        quantityInput.value = quantity;
        if (!checked) {
            quantityInput.setAttribute('readonly', true);
        };

        quantityInput.addEventListener('change', (e) => {
            e.preventDefault();

            let { value } = quantityInput;

            if (value < 0) {
                value = 0;
            };

            setQuantity(id, value);
        })
        quantityElement.appendChild(quantityInput);

        let totalElement = row.insertCell(4);
        totalElement.appendChild(document.createTextNode(total));
    });

    calcTotal();
};

// emulateServer using Promise
const filterItemsPromise = (value, p = items) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            let cloneItems = [];

            if (value === 'all') {
                cloneItems = items;
            } else {
                cloneItems = p.filter((item) => {
                    let { price } = item;
                
                    if (value === 'under200') {
                        return (price < 200);
                    };
                    
                    if (value === '200to500') {
                        return (price >= 200) && (price <= 500);
                    };
                    
                    if (value === 'above500') {
                        return (price > 500);
                    };
                });
            };

            resolve(cloneItems);
        }, 500);
    });
};

const getDataPromise = () => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const products = [
                { name: 'iPhone 9', price: 700 },
                { name: 'Samsung', price: 400 },
                { name: 'Nokia', price: 100 },
                { name: 'Sony Xperia', price: 450 },
                { name: 'Motorola', price: 180 },
                { name: 'Oppo', price: 600 },
                { name: 'bPhone', price: 90 }
            ];

            resolve(products);
        }, 1000);
    });
};

const calcTotalPromise = (p = items) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(p.reduce((total, item) => total + (+item.total), 0));
        }, 500);
    });
};

const setcheckBoxPromise = (id, checked) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            let index = items.findIndex((item) => item.id == id);

            items[index].checked = !items[index].checked;
            
            if (items[index].checked) {
                calcSingleItem(index);
            } else {
                items[index].total = 0;
            };

            resolve('success');
        }, 500);
    });
};

const setQuantityPromise = (id, value) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            let index = items.findIndex((item) => item.id == id);
            items[index].quantity = value;
            calcSingleItem(index);

            resolve('success');
        }, 500);
    });
};

// api
const getData = async() => {
    try {
        const data = await getDataPromise();

        data.forEach((i, index) => {
            let { name, price } = i;
            items = [...items, { id: index, name, price, quantity: 0, total: 0, checked: false } ];
        });

        filterItems();
    } catch (error) {
        console.log(error);
    };
};

const calcTotal = async() => {
    try {
        const data = await calcTotalPromise();

        totalMoneyElement.textContent = data;
    } catch (error) {
        console.log(error);
    };
};

const setCheckBox = async(id, checked) => {
    try {
        const data = await setcheckBoxPromise(id, checked);

        if (data == 'success') {
            filterItems();
        };
    } catch (error) {
        console.log(error);
    };
};

const setQuantity = async(id, value) => {
    try {
        const data = await setQuantityPromise(id, value);
        
        if (data == 'success') {
            filterItems();
        };
    } catch (error) {
        console.log(error);
    };
};

const filterItems = async(p = items) => {
    try {
        let { value } = priceFilterElement;

        const data = await filterItemsPromise(value, p);

        renderItems(data);
    } catch (error) {
        console.log(error);
    };
};

priceFilterElement.addEventListener('change', (e) => {
    e.preventDefault();
    filterItems();
});

document.addEventListener('DOMContentLoaded', () => {
    getData();
});