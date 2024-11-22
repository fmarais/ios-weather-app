import Foundation

public struct CurrentWeatherModel: Decodable {
    let weather: [WeatherData]
    let main: WeatherMain
    let name: String
    let wind: WeatherWind
}

public struct FiveDayForecastWeatherModel: Decodable {
    let list: [WeatherList]
}

struct WeatherList: Decodable {
    let main: WeatherMain
}

struct WeatherData: Decodable {
    let id: Double
    let main: String
    let description: String
    let icon: String
}

struct WeatherMain: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Double
    let humidity: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct WeatherWind: Decodable {
    let speed: Double
    let deg: Double
}


