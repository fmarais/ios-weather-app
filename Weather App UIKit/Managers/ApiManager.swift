import Foundation
import CoreLocation

class ApiManager {
    // Api docs here:
    // https://openweathermap.org/current
    // https://openweathermap.org/forecast5

    fileprivate static let API_KEY =  Bundle.main.object(forInfoDictionaryKey: "WEATHER_API_KEY") ?? "ADD_API_KEY_HERE"
    fileprivate static let BASE_URL = "https://api.openweathermap.org/data/2.5"
    fileprivate static let CURRENT_WEATHER_URL = "\(BASE_URL)/weather"
    fileprivate static let FIVE_DAY_FORECAST_URL = "\(BASE_URL)/forecast"

    static func getCurrentWeatherUrl(latitude: String, longitude: String) -> URL? {
        let url = "\(Self.CURRENT_WEATHER_URL)?lat=\(latitude)&lon=\(longitude)&appid=\(Self.API_KEY)&units=metric" // static ref Self
        return URL(string: url)
    }

    static func getFiveDayForecastWeatherUrl(latitude: String, longitude: String) -> URL? {
        let url = "\(Self.FIVE_DAY_FORECAST_URL)?lat=\(latitude)&lon=\(longitude)&appid=\(Self.API_KEY)&units=metric" // static ref Self
        return URL(string: url)
    }

    static func getWeatherFromApi<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        LoggingManager.debug("getWeatherFromApi(), url: \(url)")
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            LoggingManager.debug("getWeatherFromApi(), urlRequest complete")

            // Check for errors
            if let error = error {
                completion(.failure(error))
                return
            }

            // Ensure we have data
            guard let dataSafe = data else {
                completion(.failure(NSError(domain: "DataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not load data"])))
                return
            }

            // Decode the data
            do {
                if let debugResponse = String(data: dataSafe, encoding: .utf8) {
                    LoggingManager.debug("getWeatherFromApi(), debugResponse: \(debugResponse)")
                }

                let decodedData = try JSONDecoder().decode(T.self, from: dataSafe)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
