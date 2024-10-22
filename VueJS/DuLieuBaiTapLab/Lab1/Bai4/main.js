document.addEventListener('DOMContentLoaded', () => {
    const { createApp } = Vue;

    createApp({
        data() {
            return {
                product: [],
                searchQuery: '',
                editIndex: null,
                filteredProducts: [],
                defaultProductPrice: 0,
                buttonAddText: 'Add Product',
                inputProductName: '',
                inputProductPrice: 0,
                inputSearch: '',
            };
        },

        methods: {
            addProduct() {
                let { inputProductName: name, inputProductPrice: price } = this;
                this.product = [...this.product, { name, price }];
                this.inputProductName = '';
                this.inputProductPrice = 0;
            },
            deleteProduct(index) {
                this.product.splice(index, 1);
            },
            editProduct(index) {
                this.inputProductName = this.product[index].name;
                this.inputProductPrice = this.product[index].price;
                this.deleteProduct(index);
            }
        }
    
    }).mount('#app');

});