# Running the project
- Git clone this repo `git clone git@github.com:fmarais/ios-weather-app.git`
- Open the project `.workspace`
- Add the api key provided in the email to the `info.plist` `WEATHER_API_KEY`
- Build and run the project

# Overview
- The `MVC` architecture was used as its simple and robust, especially for smaller projects. Larger project might gain more benifit from the `MVVM` or `VIPER` architectures as there is more seperation of concerns.
- Third parties used: `SwiftLint` pod as an example implementation
- Protocols, Extensions and dynamic types used.
- Models, enums and local json stubs added so we can use the SwiftUI previews when building out the UI.
- CoreData to store the lat/lng coordinates. This can easily be extended to store response json objects as well so that we dont have to make a fresh request each time etc. Might be usefull to add a timestamp so we know how old the data is.
- Example gitlab config four our CI/CD pipeline where we can automate running lint and unit tests
- UIKit was used on the welcome screen, we then transition to SwiftUI views for the WeatherView
- Added a custom logger implementation that is initialised on app startup and avail throughout the app

## Example variants
<img width="260" alt="Screenshot 2024-11-22 at 20 25 13" src="https://github.com/user-attachments/assets/9e57dd95-8f02-4de6-9f5a-89675027aa66">
<img width="256" alt="Screenshot 2024-11-22 at 20 25 35" src="https://github.com/user-attachments/assets/fdb75f46-8673-4e97-8775-599416ab93d5">
<img width="266" alt="Screenshot 2024-11-22 at 20 25 52" src="https://github.com/user-attachments/assets/a1cd20ab-e8bd-44bd-93e5-502e05d981ca">

## Test run
https://github.com/user-attachments/assets/56feaff6-50fe-4747-aec6-57e9c399287e

## Test
- Allow your location on app startup
- View the daily and forecast weather
- Press back, click the blue button a 2nd time
- The app should immediatly move to the WeatherView since it has saved the lat/lng coordinates to the device
