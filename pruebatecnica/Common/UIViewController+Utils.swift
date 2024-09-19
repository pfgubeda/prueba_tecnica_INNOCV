
import UIKit

extension UIViewController {
    
    func addCloseButton(target: Any?, action: Selector) {
        let closeImage = UIImage(systemName: "xmark")
        let closeBarButton = UIBarButtonItem(image: closeImage, style: .plain, target: target, action: action)
        navigationItem.setRightBarButton(closeBarButton, animated: false)
        navigationItem.rightBarButtonItem?.tintColor = .tintCloseColor
    }
}
