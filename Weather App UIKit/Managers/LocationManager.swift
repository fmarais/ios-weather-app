import Foundation
import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var welcomeViewController: WelcomeViewController?

    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        //        self.location = location
        //        self.isLoading = isLoading
        
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(welcomeViewController: WelcomeViewController) {
        LoggingManager.debug("LocationManager, requestLocation()")
        self.welcomeViewController = welcomeViewController
        isLoading = true
        manager.requestLocation()
    }

    // location success
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
        LoggingManager.debug("Success: Location lat: \(String(describing: location?.latitude)),  lon: \(String(describing: location?.longitude))")


        guard let welcomeViewController = welcomeViewController else {
            LoggingManager.debug("Error: WelcomeView unavailable")
            return
        }
        welcomeViewController.navigateToWeatherView()
    }

    // location fail
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        LoggingManager.debug("Error: Failed to get location")
        isLoading = false
    }
}
