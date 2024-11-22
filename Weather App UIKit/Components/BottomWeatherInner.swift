import Foundation
import SwiftUI

struct BottomWeatherInner: View {
    var currentWeather: CurrentWeatherModel?
    var fiveDayWeather: FiveDayForecastWeatherModel?
    var color: Color

    var body: some View {
        VStack {
            HStack {
                // min
                VStack() {
                    Text("\(currentWeather?.main.tempMin.roundDouble() ?? "")" + ("°")).bold()
                    Text("min")
                }.frame(maxWidth: .infinity)

                // current
                VStack() {
                    Text("\(currentWeather?.main.temp.roundDouble() ?? "")" + ("°")).bold()
                    Text("Current")
                }.frame(maxWidth: .infinity)

                // max
                VStack() {
                    Text("\(currentWeather?.main.tempMax.roundDouble() ?? "")" + ("°")).bold()
                    Text("max")
                }.frame(maxWidth: .infinity)

            }.padding(15)

            Divider()
                .frame(height: 1)
                .padding(.horizontal)
                .background(Color.white)

            VStack() {
                ScrollView{
                    if let weatherListSafe = fiveDayWeather?.list {
                        ForEach(weatherListSafe.indices) { index in
                            let item = weatherListSafe[index]

                            HStack() {
                                VStack() {
                                    Text("\(item.dtTxt)")
                                }.frame(maxWidth: .infinity)

                                VStack() {
                                    if item.weather.first?.weatherCondition == "sun" {
                                        Image("icon_sun")
                                            .resizable()
                                            .frame(width: 32.0, height: 32.0)
                                    }

                                    if item.weather.first?.weatherCondition == "rain" {
                                        Image("icon_rain")
                                            .resizable()
                                            .frame(width: 32.0, height: 32.0)
                                    }

                                    if item.weather.first?.weatherCondition == "cloud" {
                                        Image("icon_cloud")
                                            .resizable()
                                            .frame(width: 32.0, height: 32.0)
                                    }
                                }.frame(maxWidth: .infinity)

                                VStack() {
                                    Text("\(item.main.temp.roundDouble())°")
                                }.frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
            }
        }.background(color).foregroundStyle(.white)
    }
}

#Preview {
    //    BottomWeatherComponent(currentWeather: currentWeatherJson, fiveDayWeather: fiveDayForecastJson, color: Color(.rainy))
    //    BottomWeatherComponent(currentWeather: currentWeatherJson, fiveDayWeather: fiveDayForecastJson, color: Color(.cloudy))
    BottomWeatherInner(currentWeather: currentWeatherJson, fiveDayWeather: fiveDayForecastJson, color: Color(.sunny))
}
