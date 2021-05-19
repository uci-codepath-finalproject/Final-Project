Original App Design Project - README
===

# WeatherPal

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
### Description
Displays weather forecasts and useful tips based on a provided zip code, city, or region.  WeatherPal could be used to receive the latest weather updates and important tips, such as wearing warmer clothes or bringing an umbrella, all in one centralized place.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
Weather
- **Mobile:**
This application is for mobile use only and is not available for desktop.
- **Story:**
User inputs a location, views the weather forecast, and receives tips.  The user can then follow tips to save time thinking on how to prepare for upcoming weather conditions and instead get out the door quickly.
- **Market:**
This application is available for all users without any restrictions in a safe and user friendly environment.
- **Habit:**
This application could be used whenever convenient by the user, and would most likely be used whenever the user needs to leave their house or travel somewhere.  It could become an essential tool for planning outings.
- **Scope:**
We anticipate starting off our app by providing generic tips on clothing, driving conditions, visibility, and air quality and then later expanding to more customizable recommendations that each user can filter.  We also anticipate expanding to synchronize with home-use software such as Google Home, Amazon Echo Dot, and more.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] * User can sign up an account and log in 
- [ ] * User can search for a new location
- [ ] * Each location result is displayed in a new page
- [ ] * Location result page displays weather forecasts and tips
- [ ] * Settings (Locations, Notification, General Display)

**Optional Nice-to-have Stories**

- [ ] * User can save locations to be remembered the next time they log in
- [ ] * Map to view weather forecasts on based on current location
- [ ] * Share forecast / tips on social media
- [ ] * Support animation for different weather results or tips
- [ ] * Support chat functionality to communicate with other users

### 2. Screen Archetypes

* Login
* Create Account
   * When users close app or first download the app, they must log in to gain access to their app and personal settings
* Location Search Screen
   * Users can use the search bar to enter a location to view forecasts for
* Forecast Page
   * Users can view predicted weather forecasts and tips.
* Settings Page
   * Users can change account information and other settings.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* profile
* Location search / forecast
* setting

Optional:

* Saved Locations Page
* Chat Message Screen
* Share to Social Media Screen

**Flow Navigation** (Screen to Screen)

* Forced Log In -> Account Signup If No Account
* Location Search -> Forecast page
* Settings -> Change Settings

## Wireframes
<img src="https://i.imgur.com/6pye6jw.jpeg" width=600>


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models
Model to Store User Information
|Property|Type|Description|
|--------|----|-----------|
|objectID|String|Unique id to identify the user entry|
|name|String|The name of the user|
|age|Number|The age of the user|
|username|String|The user’s login username|
|password|String|The user’s login password|

### Networking
**Network Requests** 
- (CreateAccount / POST) Create a new user entry with login / password fields
- (Validate/GET) Check if login / password combination is valid
```
let query = PFQuery(className:"Profiles")
let username = usernameField.text!
let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password, block: { 
		... // do something in code
        })
```
- (Delete) Delete an existing user who wants to terminate their account
- (Edit/POST) Change profile information
- (ViewProfile/GET) Get information about a specific user to render their profile page

**External APIs**
- OpenWeather Map API - Weather forecasting & statistics


|HTTP Verb|Endpoint|Description|
|---------|--------|-----------|
|GET|api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}|Get current weather information by city|
|GET|api.openweathermap.org/data/2.5/weather?zip={zip code},{country code}&appid={API key}|Get current weather information by zip code|
|GET|api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}|Gives detailed forecast (by the minute, hour, day) of a specified latitude / longitude|
|GET|api.openweathermap.org/data/2.5/forecast?q={city name}&appid={API key}|Gives 5-day forecast of a particular city|

- Example JSON Response


```
{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  } 
```
## Video Walkthrough

Work Completed So Far
![demo](Asset/)
