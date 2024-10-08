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

    let countMenu = -1;

    while(true) {
        countMenu++;

        let menu = document.getElementById('menu-khoa-hoc-khac-sam-dev');

        if (countMenu > 0) {
            menu = document.getElementById(`menu-khoa-hoc-khac-sam-dev-${countMenu}`);
        }

        if (menu == null) {
            break;
        }

        let newMenu = document.createElement('ul');

        let size = 5;
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

            menu.removeChild(li);
            if (url_li === window.location.pathname) {
                size++;
            } else {
                let li2 = document.createElement('li');
                li2.className = "menu-item-new";
                let button = document.createElement('button');

                var leftDiv = document.createElement('div');
                leftDiv.className = 'left';
                var rightDiv = document.createElement('div');
                rightDiv.className = 'right';

                button.appendChild(leftDiv);
                let a = li.getElementsByTagName('a')[0];
                button.appendChild(document.createTextNode(a.innerText));
                button.appendChild(rightDiv);

                button.setAttribute('style', "--content: '" + a.innerText +"';");
                button.addEventListener('click', function(e) {
                    window.location.href = a.href;
                });
                
                li2.appendChild(button);
                newMenu.appendChild(li2);
            };
        };

        replaceUL(menu, newMenu);
        menu.className = "menu-2";
    };
});