import Foundation
import SwiftUI

struct MainWeatherComponent: View {
    var currentWeather: CurrentWeatherModel?
    var fiveDayWeather: FiveDayForecastWeatherModel?
    
    var body: some View {
        VStack(spacing: 0) {
            if currentWeather?.weather.first?.weatherCondition == "sun" {
                TopWeatherInner(currentWeather: currentWeatherJson, imageName: "main_sun", color: Color(.sunny))
                BottomWeatherInner(currentWeather: currentWeather, fiveDayWeather: fiveDayWeather, color: Color(.sunny))
            }
            
            if currentWeather?.weather.first?.weatherCondition == "cloud" {
                TopWeatherInner(currentWeather: currentWeatherJson, imageName: "main_cloud", color: Color(.cloudy))
                BottomWeatherInner(currentWeather: currentWeather, fiveDayWeather: fiveDayWeather, color: Color(.cloudy))
            }
            
            if currentWeather?.weather.first?.weatherCondition == "rain" {
                TopWeatherInner(currentWeather: currentWeatherJson, imageName: "main_rain", color: Color(.rainy))
                BottomWeatherInner(currentWeather: currentWeather, fiveDayWeather: fiveDayWeather, color: Color(.rainy))
            }
        }
    }
}

#Preview {
    MainWeatherComponent(currentWeather: currentWeatherJson, fiveDayWeather: fiveDayForecastJson)
}
