import UIKit

extension UIFont {
    class var largeTitle: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .bold)
    }

    class var baseNavigationTitleFont: UIFont {
        return UIFont(name: "JosefinSans-Bold", size: 17.0) ?? UIFont.systemFont(ofSize: 17, weight: .bold)
    }

    class var errorHeadlineBoldFont: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .medium)
    }

    class var textFieldErrorFont: UIFont {
            return UIFont.systemFont(ofSize: 10, weight: .semibold)
    }

    class var tooltipBoldFont: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .bold)
    }

    class var baseAppTextFont: UIFont {
        return UIFont.systemFont(ofSize: 15)
    }

    class var baseAppMediumTextFont: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .medium)
    }

    class var baseAppSemiTextFont: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .semibold)
    }

    class var baseAppBoldTextFont: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .bold)
    }

    class var buttonFont: UIFont {
        return UIFont(name: "JosefinSans-Bold", size: 14.0) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    }

    class var buttonFontBold: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .bold)
    }

    class var priceFilterFont: UIFont {
        return UIFont.systemFont(ofSize: 74, weight: .thin)
    }

    class var smallStyledFont: UIFont {
        return UIFont.systemFont(ofSize: 10, weight: .regular)
    }

    class var smallBoldStyledFont: UIFont {
        return UIFont.systemFont(ofSize: 10, weight: .bold)
    }

    class var titleStyledFont: UIFont {
        return UIFont(name: "JosefinSans-Bold", size: 42) ?? UIFont.systemFont(ofSize: 42, weight: .bold)
    }
}
