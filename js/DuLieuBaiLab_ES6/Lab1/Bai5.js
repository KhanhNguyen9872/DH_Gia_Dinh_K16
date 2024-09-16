let ul = document.getElementById("book-list");
let bookList = [];

let bookForm = document.getElementById("book-form");
let titleElement = document.getElementById("title");
let authorElement = document.getElementById("author");
let pagesElement = document.getElementById('pages');
let totalPagesElement = document.getElementById("total-pages");

function deleteBook(index) {
    bookList = bookList.filter((book, i) => { 
        return i !== index; 
    });
};

function renderBook() {
    ul.innerHTML = '';

    bookList.forEach((book, index) => {
        let li = document.createElement('li');

        let {title: title} = book;
        let {author: author} = book;
        let {pages: pages} = book; 

        let btnEdit = document.createElement('button');
        let btnDel = document.createElement('button');

        btnEdit.appendChild(document.createTextNode('Sửa'));
        btnDel.appendChild(document.createTextNode('Xóa'));

        btnEdit.addEventListener('click', () => {
            let book = bookList[index];

            titleElement.value = book.title;
            authorElement.value = book.author;
            pagesElement.value = book.pages;

            deleteBook(index);
        });

        btnDel.addEventListener('click', () => {
            deleteBook(index);
            renderBook();
        });

        // add to li
        li.appendChild(document.createTextNode(title));
        li.appendChild(document.createTextNode(author));
        li.appendChild(document.createTextNode(pages));
        li.appendChild(btnEdit);
        li.appendChild(btnDel);

        ul.appendChild(li);
    });
    
    let total = bookList.reduce((total, book) => {
        let pages = +book.pages;
        return total + pages;
    }, 0);

    totalPagesElement.textContent = `Tổng số trang: ${total}`;
};

bookForm.addEventListener('submit', (e) => {
    e.preventDefault();

    let {value: title} = titleElement;
    let {value: author} = authorElement;
    let {value: pages} = pagesElement;

    if (isNaN(pages) || pages < 1) {
        alert('Vui lòng nhập số trang hợp lệ.');
        return;
    };

    bookList = [...bookList, { title, author, pages }];

    renderBook();

    bookForm.reset();
});
