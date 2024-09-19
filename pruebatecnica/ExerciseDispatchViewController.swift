
import UIKit

class ExerciseDispatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Navigator.default.lastPresented = self
    }

    @IBAction private func onCollectionViewExercise(button: UIButton) {
        Navigator.default.openFlow {
            ExerciseCollectionViewController.create()
        }
    }
    
    @IBAction private func onDataServicesExercise(button: UIButton) {
        Navigator.default.openFlow {
            ExerciseDataServicesViewController.create()
        }
    }
    
    @IBAction private func onTestingExercise(button: UIButton) {
        
    }
}

