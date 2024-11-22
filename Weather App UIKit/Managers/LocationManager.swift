import Foundation
import CoreData
import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    weak var delegate: LocationManagerProtocol?
    
    init(delegate: LocationManagerProtocol) {
        super.init()
        self.delegate = delegate
        manager.delegate = self
    }
    
    func requestAuth() {
        if let (latitudeSafe, longitudeSafe) = CoreDataManager.loadLocationData(CoreDataManager.ENTITY) {
            // use local location data
            delegate?.locationSuccess(latitude: latitudeSafe, longitude: longitudeSafe)
        } else {
            // new auth request
            manager.requestWhenInUseAuthorization()
        }
    }
    
    // handle the callback for `requestWhenInUseAuthorization()`
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            LoggingManager.debug("When user did not yet determined")
        case .restricted:
            LoggingManager.debug("Restricted by parental control")
        case .denied:
            LoggingManager.debug("When user select option Dont't Allow")
        case .authorizedWhenInUse:
            LoggingManager.debug("When user select option Allow While Using App or Allow Once")
            requestLocation()
        default:
            LoggingManager.debug("default")
        }
    }
    
    func requestLocation() {
        LoggingManager.debug("LocationManager, requestLocation()")
        manager.requestLocation()
        delegate?.requestLocation()
    }
    
    // location success
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first?.coordinate
        LoggingManager.debug("Success: Location lat: \(String(describing: location?.latitude)),  lon: \(String(describing: location?.longitude))")
        
        // save to local
        let latitude = location?.latitude.description ?? ""
        let longitude = location?.longitude.description ?? ""
        CoreDataManager.saveLocationData(CoreDataManager.ENTITY, latitude: latitude, longitude:  longitude)
        delegate?.locationSuccess(latitude: latitude, longitude: longitude)
    }
    
    // location fail
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        LoggingManager.debug("Error: Failed to get location: \(error)")
        delegate?.locationFail(error: error)
    }
}

protocol LocationManagerProtocol : NSObjectProtocol{
    func locationSuccess(latitude: String, longitude: String)
    func locationFail(error: any Error)
    func requestLocation()
}
