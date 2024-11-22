import UIKit

extension UIColor {
    @nonobjc class var appSkeletonGrey: UIColor {
        return UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
    }
    // 11/06/2019: New Zeplin Colours
    @nonobjc class var mercury: UIColor {
        return UIColor(white: 242.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var defaultPlaceholder: UIColor {
        return UIColor(red: 199/255, green: 199/255, blue: 205/255, alpha: 1.0)
    }
    @nonobjc class var silver: UIColor {
        return UIColor(white: 217.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var iron: UIColor {
        return UIColor(white: 173.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var steel: UIColor {
        return UIColor(red: 118.0 / 255.0, green: 120.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var tungsten: UIColor {
        return UIColor(red: 46.0 / 255.0, green: 49.0 / 255.0, blue: 49.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var supGreen: UIColor {
        return UIColor(red: 6 / 255, green: 163 / 255.0, blue: 102 / 255.0, alpha: 1.0)
    }

    @nonobjc class var lightApple: UIColor {
        return UIColor(red: 231.0 / 255.0, green: 249.0 / 255.0, blue: 235 / 255.0, alpha: 1.0)
    }

    @nonobjc class var kiwi: UIColor {
        return UIColor(red: 53.0 / 255.0, green: 201.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var citrus: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 135.0 / 255.0, blue: 35.0 / 255.0, alpha: 1.0)
    }

    @nonobjc private class var dmCherry: UIColor {
        return UIColor(red: 163.0 / 255.0, green: 17.0 / 255.0, blue: 1.0 / 255.0, alpha: 1.0)
    }

    @nonobjc private class var defaultCherry: UIColor {
        return UIColor(red: 1.0, green: 31.0 / 255.0, blue: 6.0 / 255.0, alpha: 1.0)
    }

    @nonobjc private class var dmPrimaryBackground: UIColor {
        return UIColor(red: 46.0 / 255.0, green: 49.0 / 255.0, blue: 49.0 / 255.0, alpha: 1.0)
    }

    @nonobjc private class var defaultPrimaryBackground: UIColor {
        return UIColor.white
    }

    @nonobjc private class var dmPrimaryText: UIColor {
        return UIColor.white
    }

    @nonobjc private class var defaultPrimaryText: UIColor {
        return UIColor.black
    }

    @nonobjc class var black30: UIColor {
        return UIColor(white: 0.0, alpha: 0.3)
    }

    @nonobjc class var black50: UIColor {
        return UIColor(white: 0.0, alpha: 0.5)
    }

    @nonobjc class var black75: UIColor {
        return UIColor(white: 0.0, alpha: 0.75)
    }

    @nonobjc class var brightBlue: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 119.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var charcoal: UIColor {
        return UIColor(red: 118/255, green: 120/255, blue: 120/255, alpha: 1.0)
    }

    // Toast Colors October 2023
    @nonobjc class var supToastGreen: UIColor {
        return UIColor(red: 162 / 255, green: 221 / 255.0, blue: 198 / 255.0, alpha: 1.0)
    }

    @nonobjc class var supToastRed: UIColor {
        return UIColor(red: 255 / 255, green: 181 / 255.0, blue: 188 / 255.0, alpha: 1.0)
    }

    @nonobjc class var supToastBlue: UIColor {
        return UIColor(red: 189 / 255, green: 204 / 255.0, blue: 249 / 255.0, alpha: 1.0)
    }

    @nonobjc class var supErrorRed: UIColor {
        return UIColor(red: 0.8549, green: 0.0980, blue: 0, alpha: 1.0)
    }
}

// Dark Mode Presets
extension UIColor {
    @nonobjc class var primaryBackground: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return dmPrimaryBackground
                default:
                    return defaultPrimaryBackground
                }
            }
            return dynamicColor
        }
        return defaultPrimaryBackground
    }

    @nonobjc class var secondaryBackground: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return UIColor.black30
                default:
                    return UIColor.mercury
                }
            }
            return dynamicColor
        }
        return UIColor.mercury
    }

    @nonobjc class var primaryText: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return dmPrimaryText
                default:
                    return defaultPrimaryText
                }
            }
            return dynamicColor
        }
        return defaultPrimaryText
    }

    @nonobjc class var primaryTextTinted: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return dmPrimaryText
                default:
                    return tungsten
                }
            }
            return dynamicColor
        }
        return defaultPrimaryText
    }

    @nonobjc class var secondaryText: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return UIColor.iron
                default:
                    return UIColor.steel
                }
            }
            return dynamicColor
        }
        return UIColor.steel
    }

    @nonobjc class var primarySkeleton: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return UIColor.black75
                default:
                    return UIColor.appSkeletonGrey
                }
            }
            return dynamicColor
        }
        return UIColor.appSkeletonGrey
    }

    @nonobjc class var cherry: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return dmCherry
                default:
                    return defaultCherry
                }
            }
            return dynamicColor
        }
        return defaultCherry
    }

    @nonobjc class var primaryButton: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return .iron
                default:
                    return .black
                }
            }
            return dynamicColor
        }
        return black
    }

    @nonobjc class var primaryButtonText: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return .steel
                default:
                    return white
                }
            }
            return dynamicColor
        }
        return white
    }

    @nonobjc class var primaryButtonDesctructive: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return dmCherry
                default:
                    return defaultCherry
                }
            }
            return dynamicColor
        }
        return defaultCherry
    }

    @nonobjc class var primaryButtonDisabled: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return .black75
                default:
                    return .iron
                }
            }
            return dynamicColor
        }
        return .iron
    }

    @nonobjc class var primaryButtonOrange: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return citrus.withAlphaComponent(0.75)
                default:
                    return citrus
                }
            }
            return dynamicColor
        }
        return citrus
    }

    @nonobjc class var primaryButtonInlineText: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return kiwi
                default:
                    return supGreen
                }
            }
            return dynamicColor
        }
        return supGreen
    }

    @nonobjc class var primaryCheckmarkUnselected: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return steel
                default:
                    return silver
                }
            }
            return dynamicColor
        }
        return silver
    }

    @nonobjc class var primaryCheckmarkSelected: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return kiwi
                default:
                    return black
                }
            }
            return dynamicColor
        }
        return black
    }

    @nonobjc class var primaryDivider: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return black30
                default:
                    return mercury
                }
            }
            return dynamicColor
        }
        return mercury
    }

    @nonobjc class var cartExpiryBanner: UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return black
                default:
                    return mercury
                }
            }
            return dynamicColor
        }
        return mercury
    }
}
