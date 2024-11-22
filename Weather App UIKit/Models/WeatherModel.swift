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
    let weather: [WeatherData]
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case main
        case weather
        case dtTxt = "dt_txt"
    }
}

struct WeatherData: Decodable {
    let id: Double
    let main: String
    let description: String
    let icon: String

    var weatherCondition: String{
        switch id {
        case 200...622:
            return "rain"
        case 701...781:
            return "cloud"
        case 800:
            return "sun"
        default:
            return "cloud"
        }
    }
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


