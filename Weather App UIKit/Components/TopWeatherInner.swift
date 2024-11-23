import Foundation
import SwiftUI

struct TopWeatherInner: View {
    var currentWeather: CurrentWeatherModel?
    var imageName: String
    var color: Color
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width)
                
                VStack {
                    Text("\(currentWeather?.main.feelsLike.roundDouble() ?? "")" + "°")
                        .bold()
                        .font(.system(size: 80))
                    
                    Text("\(currentWeather?.weather[0].main ?? "")")
                        .bold()
                        .font(.system(size: 50))
                }
                .foregroundStyle(.white)
            }
        }
        .background(color)
        .frame(height: 360)
    }
}

#Preview {
    //        MainWeatherInner(currentWeather: currentWeatherJson, imageName: "main_sun", color: Color(.sunny))
    //    MainWeatherInner(currentWeather: currentWeatherJson, imageName: "main_cloud", color: Color(.cloudy))
    TopWeatherInner(currentWeather: currentWeatherJson, imageName: "main_rain", color: Color(.rainy))
}
