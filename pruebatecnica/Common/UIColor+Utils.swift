
import UIKit

extension UIColor {
    
    private static var isLightTheme: Bool {
        UITraitCollection.current.userInterfaceStyle == .light
    }
    
    static var tintCloseColor: UIColor {
        isLightTheme ? .black : .white
    }
}
