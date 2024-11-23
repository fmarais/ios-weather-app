import UIKit
import SwiftUI
import CoreLocation

private var loadingView : UIView?
private var isLoading = false

class MainViewController: UIViewController {
    var locationManager: LocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = LocationManager(delegate: self)
        loadCustomView()
    }
    
    private func loadCustomView() {
        let mainView = MainView(frame: self.view.bounds)
        mainView.viewController = self
        mainView.delegate = self
        mainView.center = view.center
        view.addSubview(mainView)
    }
    
    func showWeatherViewSwiftUI(latitude: String, longitude: String) {
        let weatherView = WeatherView(latitude, longitude)
        
        // show new view as root view
        let uiHostingController = UIHostingController(rootView: weatherView)
        uiHostingController.modalPresentationStyle = .fullScreen
        //        present(uiHostingController, animated: true)
        navigationController?.pushViewController(uiHostingController, animated: true)
    }
}

extension MainViewController: MainViewProtocol {
    func locationButtonClicked() {
        LoggingManager.debug("locationButtonClicked() 2")
        locationManager?.requestAuth()
    }
}

extension UIViewController {
    func showLoading() {
        if !isLoading {
            LoggingManager.debug("showLoading()")
            
            loadingView = UIView(frame: self.view.bounds)
            guard let loadingViewSafe = loadingView else {
                LoggingManager.debug("LoadingView is invalid")
                return
            }
            
            loadingViewSafe.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)
            let indicatorView = UIActivityIndicatorView(style: .large)
            indicatorView.center = loadingViewSafe.center
            indicatorView.startAnimating()
            loadingView?.addSubview(indicatorView)
            view.addSubview(loadingViewSafe)
            isLoading = true
        }
    }
    
    func hideLoading() {
        if isLoading {
            LoggingManager.debug("hideLoading()")
            loadingView?.removeFromSuperview()
            loadingView = nil // for any other strong refs still lingering
            isLoading = false
        }
    }
}

extension MainViewController: LocationManagerProtocol {
    func locationSuccess(latitude: String, longitude: String) {
        LoggingManager.debug("locationSuccess()")
        showWeatherViewSwiftUI(latitude: latitude, longitude: longitude)
        hideLoading()
    }
    
    func locationFail(error: any Error) {
        LoggingManager.debug("locationFail()")
        hideLoading()
    }
    
    func requestLocation() {
        LoggingManager.debug("requestLocation()")
        showLoading()
    }
}
