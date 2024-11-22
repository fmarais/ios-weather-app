import Foundation
import os
import SwiftUI
import CoreLocation

class WeatherViewControler: ObservableObject {
    var apiManager = ApiManager()
    var latitude, longitude: String?

    // api data
    init(_ latitude: String, _ longitude: String) {
        LoggingManager.debug("WeatherViewControler init() location")
        self.latitude = latitude
        self.longitude = longitude
    }

    // json data
    init(_ currentWeather: CurrentWeatherModel?, _ fiveDayWeather: FiveDayForecastWeatherModel?) {
        LoggingManager.debug("WeatherViewControler init() currentWeather, fiveDayWeather")
        self.latitude = nil // load using response data
        self.longitude = nil // load using response data
    }
}

