import UIKit

class MainViewController: UIViewController {




    let locationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get current location", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didClickLocationButton), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    @objc func didClickLocationButton() {
        LoggingManager.debug(">>> didClickLocationButton()")
    }



}

