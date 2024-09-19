
import UIKit

extension UIStackView {
    
    /**
     Remove all childs added to the UIStackView receiver
     */
    func clean() {
        arrangedSubviews.forEach { view in
            self.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
