
import UIKit

extension UIView {
    
    func anchorToSuperview(constant: CGFloat = 0) {
        guard let superview = superview else { return }
        topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: constant).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: constant).isActive = true
    }   
}
