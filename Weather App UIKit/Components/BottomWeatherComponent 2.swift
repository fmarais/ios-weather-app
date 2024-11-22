import Foundation
import SwiftUI

struct MainWeatherComponent: View {
    let currentWeather: CurrentWeatherModel?

    init(_ currentWeather: CurrentWeatherModel?) {
        self.currentWeather = currentWeather
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(currentWeather?.name ?? "")
                    .bold()
                    .font(.title)

                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.light)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            VStack {
                HStack {
                    VStack(spacing: 20) {
                        Image(systemName: "cloud")
                            .font(.system(size: 40))

                        Text("\(currentWeather?.weather[0].main ?? "")")
                    }
                    .frame(width: 150, alignment: .leading)

                    Spacer()

                    Text(currentWeather?.main.feelsLike.roundDouble() ?? "" + "°")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                }

                Spacer()
                    .frame(height:  80)

                AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                } placeholder: {
                    ProgressView()
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

