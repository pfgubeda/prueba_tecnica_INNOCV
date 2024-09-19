
import UIKit

class ExerciseBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseConfigureView()
    }
    
    private func baseConfigureView() {
        addCloseButton(target: self, action: #selector(onClose))
    }
    
    @objc private func onClose() {
        Navigator.default.dismiss()
    }
}
