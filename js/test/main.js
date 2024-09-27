document.addEventListener('DOMContentLoaded', function() {
    function randomInt(min, max) {
        min = Math.ceil(min); 
        max = Math.floor(max); 
        return Math.floor(Math.random() * (max - min + 1)) + min; 
    };

    function ulToArray(ul, tagName) {
        return Array.from(ul.getElementsByTagName(tagName));
    }

    function replaceUL(oldUL, newUL) {
        let lst = Array.from(newUL.getElementsByTagName('li'));
        oldUL.innerHTML = '';
        lst.forEach(function(e, i) {
            oldUL.appendChild(e);
        });
    }

    function getPathFromURL(url) {
        let u = new URL(url);
        return u.pathname;
    }

    let newMenu = document.createElement('ul');
    let menu = document.getElementById('menu-khoa-hoc-khac-sam-dev');

    let size = 4;
    let num = 0;
    for(let i = 0; i < size; i++) {
        let links = ulToArray(menu, 'li');
        if (links.length == 0) {
            break;
        };

        num = randomInt(0, links.length - 1);
        let li = links[num];
        li.className = "menu-item-new";

        let url_li = getPathFromURL(li.querySelector('a').href);
        console.log(url_li);

        menu.removeChild(li);
        if (url_li === window.location.pathname) {
            size++;
        } else {
            newMenu.appendChild(li);
        };
    };

    replaceUL(menu, newMenu);
    menu.className = "menu-2";
});