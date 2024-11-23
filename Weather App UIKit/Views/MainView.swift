
import UIKit

class MainView: UIView {
    // use weak refs to avoid mem leaks via orphaned strong refs
    weak var viewController: MainViewController?
    weak var delegate: MainViewProtocol?
    
    // lazy var, defer init until accessed, allows us to use self
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.largeTitle
        label.numberOfLines =  1
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Please click the button to share your current location.\n\nThis will help us show you the weather data for your location."
        label.font = UIFont.description
        label.numberOfLines =  0    // autosize
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var locationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get current location", for: .normal)
        button.backgroundColor = UIColor.brightBlue
        button.addTarget(self, action: #selector(locationButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAppearance()
    }
    
    private func setupAppearance() {
        LoggingManager.debug("setupAppearance()")
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        addSubview(locationButton)
        locationButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50).isActive = true
        locationButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // calls viewController delegate to handle click action
    @objc private func locationButtonClicked() {
        LoggingManager.debug("locationButtonClicked() 1")
        self.delegate?.locationButtonClicked()
    }
}

protocol MainViewProtocol : NSObjectProtocol{
    func locationButtonClicked()
}
