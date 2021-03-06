
[![Build Status](https://travis-ci.org/javifc/forecast.svg?branch=master)](https://travis-ci.org/javifc/forecast)

This application displays a 16 days forecast info for the given city. 
This forecast info is obtained by calling to the [Open Weather Map's API](http://openweathermap.org/forecast16)


## How to Configurate 

### 1. Obtain Open Weather Map's API_KEY 

In order to use Open Weather Map's API you have to create an API_KEY by following [this instructions](http://openweathermap.org/appid) 

Once you have the API_KEY it will have to be added to your env variables

```
$ export OPEN_WEATHER_API_KEY=<YOUR_API_KEY>
```

### 2. Download or clone this repository 

```
$ git clone https://github.com/javifc/forecast.git
```

### 3. Install gems

Go to the root application's folder and execute

```
$ bundle install
```

### 4. Start server

```
$ rails s
```

### 5. Open browser and go to http://localhost:3000


## How to Test 

I am using minitest (default in Ruby on Rails) for the unit testing. 

Go to the root application's folder and execute:

```
$ rails test
```

## Continuous Integration/Development

1 action -> 4 steps

###### a) User pushes code to Github's master branch
###### b) Github integration with [TravisCI](https://travis-ci.org) runs all the tests in TravisCI.
###### c) If all tests passed, TravisCI integration with [Pivotal Cloud Foundry](https://pivotal.io/platform) deploys the application into Pivotal Web Services.
###### d) Try it! :   https://forecast.cfapps.io/
