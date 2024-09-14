let ul = document.getElementById("book-list");

let titleElement = document.getElementById("title");
let authorElement = document.getElementById("author");
let pagesElement = document.getElementById('pages');
let totalPagesElement = document.getElementById("total-pages");

function calc() {
    let total = 0;
    ul.querySelectorAll('li').forEach((li) => {
        let page = +li.childNodes[2].textContent;
        total += page;
    });

    totalPagesElement.textContent = "Tổng số trang: " + total;
}

document.getElementById("book-form").addEventListener('submit', (e) => {
    e.preventDefault();

    let {value: title} = titleElement;
    let {value: author} = authorElement;
    let {value: pages} = pagesElement;

    let li = document.createElement('li');

    // button
    let btnEdit = document.createElement('button');
    let btnDel = document.createElement('button');

    btnEdit.appendChild(document.createTextNode('Sửa'));
    btnDel.appendChild(document.createTextNode('Xóa'));

    btnEdit.addEventListener('click', () => {
        titleElement.textContent = title;
        authorElement.textContent = author;
        pagesElement.textContent = pages;

        ul.removeChild(li);
        calc();
    });
    btnDel.addEventListener('click', () => {
        ul.removeChild(li);
        calc();
    });

    // add to li
    li.appendChild(document.createTextNode(title));
    li.appendChild(document.createTextNode(author));
    li.appendChild(document.createTextNode(pages));
    li.appendChild(btnEdit);
    li.appendChild(btnDel);

    ul.appendChild(li);
    calc();

    titleElement.textContent = '';
    authorElement.textContent = '';
    pagesElement.textContent = '';
});