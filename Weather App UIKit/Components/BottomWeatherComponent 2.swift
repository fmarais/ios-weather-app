import Foundation
import SwiftUI

struct BottomWeatherComponent: View {
    let currentWeather: CurrentWeatherModel?

    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("Weather now")
                    .bold()
                    .padding(.bottom)

                HStack {
                    WeatherRow(logo: "thermometer", name: "Min temp", value: (currentWeather?.main.tempMin.roundDouble() ?? "" + ("°")))
                    Spacer()
                    WeatherRow(logo: "thermometer", name: "Max temp", value: (currentWeather?.main.tempMax.roundDouble() ?? "" + "°"))
                }

                HStack {
                    WeatherRow(logo: "wind", name: "Wind speed", value: (currentWeather?.wind.speed.roundDouble() ?? "" + " m/s"))
                    Spacer()
                    WeatherRow(logo: "humidity", name: "Humidity", value: "\(currentWeather?.main.humidity.roundDouble() ?? "")%")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.bottom, 20)
            .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .background(.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
        }
    }
}

