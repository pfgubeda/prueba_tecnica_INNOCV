
import UIKit
import Combine

class ExerciseDataServicesViewController: ExerciseBaseViewController {
    
    static func create() -> ExerciseDataServicesViewController {
        ExerciseDataServicesViewController(nibName: "ExerciseDataServicesViewController", bundle: .main)
    }
    
    private let viewModel = ExerciseDataServicesViewModel()
    private var disposables: Set<AnyCancellable> = Set()
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ej2: Servicios"
        
        viewModel.users
            .receive(on: DispatchQueue.main)
            .sink { _ in
                // do nothing
            } receiveValue: { [weak self] users in
                self?.update(users)
            }
            .store(in: &disposables)
    }
        
    private func update(_ users: [InnocvUser]) {
        stackView.clean()
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        
        users.map { user in
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 24)
            label.textAlignment = .center
            label.text = user.name
            return label
        }.forEach(stackView.addArrangedSubview)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        viewModel.load()
    }
}
