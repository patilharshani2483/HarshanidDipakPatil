    var cityNames = [];
async function fetchWeather() {
         // example cities
        const apiKey = '666719a08d8afd395a351ef6055399e2';
        var  weatherDatares = "abc";
        const weatherPromises = cityNames.map(city => 
        fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`)
            .then(response => response.json())
        );

        Promise.all(weatherPromises)
        .then(weatherData => {
            weatherDatares= weatherData;
            weatherData.map((data, index) => {
                displayWeather(cityNames[index], data);
            });
    
            //console.log(weatherData); // Process the weather data
        })
        .catch(error => {
            console.error('Error fetching weather data:', error);
        });

        function displayWeather(city, weather) {
            const weatherElement = document.createElement('div');
            weatherElement.innerHTML = `
            <h3>${city}</h3>
            <p>Temperature: ${weather.main.temp}°C</p>
            <p>Weather: ${weather.weather[0].description}</p>
            `;
            console.log(weatherElement)
            document.getElementById('weather-container').appendChild(weatherElement);
            cityNames=[];
        }
        
        
        
        
    }
    document.getElementById('add-city').addEventListener('click', () => {
        const cityInput = document.getElementById('cityInput').value;
        if (cityInput) {
        cityNames.push(cityInput);
        console.log(cityNames)
        document.getElementById('weather-container').innerHTML="";
        fetchWeather(); // Re-fetch weather data for all cities
        }
    });