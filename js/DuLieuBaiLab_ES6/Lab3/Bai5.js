document.addEventListener('DOMContentLoaded', () => {
    let weatherForm = document.getElementById('weatherForm');
    let cityInput = document.getElementById('city');
    let weatherResultElement = document.getElementById('weatherResult');

    const getWeather = async(country) => {
        const apiKey = "6c870195b1e8390643a2a1fa01c9c15b";
        let url = `https://api.openweathermap.org/data/2.5/weather?q=${country}&APPID=${apiKey}&units=metric`;
        let request = await fetch(url);
        
        if (!request.ok) {
            throw new Error(request.statusText);
        };
        
        return await request.json();
    };

    const renderWeather = (data) => {
        let {name, main, weather} = data;
        let div = document.createElement('div');

        weatherResultElement.innerHTML = '';
        
        let nameH2 = document.createElement('h2');
        nameH2.appendChild(document.createTextNode(name));

        let temp = document.createElement('p');
        temp.appendChild(document.createTextNode(main.temp));

        let humidity = document.createElement('p');
        humidity.appendChild(document.createTextNode(main.humidity));

        let weatherDes = document.createTextNode('p');
        weatherDes.appendChild(document.createTextNode(weather[0].description));

        div.appendChild(nameH2);
        div.appendChild(temp);
        div.appendChild(humidity);
        div.appendChild(weatherDes);

        weatherResultElement.appendChild(div);
    };

    weatherForm.addEventListener('submit', (e) => {
        e.preventDefault();
        let country = cityInput.value;
        getWeather(country).then((resolve) => {
            renderWeather(resolve);
        }).catch((reject) => {

        });
    })
});