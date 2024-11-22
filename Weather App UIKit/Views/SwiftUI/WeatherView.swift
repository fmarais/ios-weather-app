import Foundation
import SwiftUI
import CoreLocation

struct WeatherView: View {
    @ObservedObject var controller: WeatherViewControler
    @State var currentWeather: CurrentWeatherModel?
    @State var fiveDayWeather: FiveDayForecastWeatherModel?

    // api data
    init(_ latitude: String, _ longitude: String) {
        controller = WeatherViewControler(latitude, longitude)
    }

    // preview data
    init(_ currentWeather: CurrentWeatherModel?, _ fiveDayWeather: FiveDayForecastWeatherModel?) {
        controller = WeatherViewControler(currentWeather, nil)
    }

    var body: some View {
        if let _ = currentWeather {
            let _ = LoggingManager.debug("WeatherView, Loaded data from api")

            ZStack(alignment: .leading) {
                MainWeatherComponent(currentWeather: currentWeather)
                BottomWeatherComponent(currentWeather: currentWeather)
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
        } else {
            let _ = LoggingManager.debug("WeatherView, loading")

            // async calls to get data from api
            CustomProgressView().task {
                guard let latitudeSafe = controller.latitude,
                      let longitudeSafe = controller.longitude else {
                    LoggingManager.debug("Error: Invalid location")
                    return
                }

                if let urlSafeCurrentWeather = ApiManager.getCurrentWeatherUrl(latitude: latitudeSafe, longitude: longitudeSafe) {
                    ApiManager.getWeatherFromApi(url: urlSafeCurrentWeather) { (result: Result<CurrentWeatherModel, Error>) in
                        switch result {
                        case .success(let response):
                            LoggingManager.debug("Weather data: \(response)")
                            currentWeather = response
                        case .failure(let error):
                            LoggingManager.debug("Error fetching weather data: \(error.localizedDescription)")
                        }
                    }
                }

                if let urlSafeFiveDayForecastWeather = ApiManager.getFiveDayForecastWeatherUrl(latitude: latitudeSafe, longitude: longitudeSafe) {
                    ApiManager.getWeatherFromApi(url: urlSafeFiveDayForecastWeather) { (result: Result<FiveDayForecastWeatherModel, Error>) in
                        switch result {
                        case .success(let response):
                            LoggingManager.debug("Weather data: \(response)")
                            fiveDayWeather = response
                        case .failure(let error):
                            LoggingManager.debug("Error fetching weather data: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    WeatherView(currentWeatherJson, fiveDayForecastJson)
}
