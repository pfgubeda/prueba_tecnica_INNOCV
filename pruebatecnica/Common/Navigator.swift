
import UIKit

class Navigator {
    
    typealias Builder = () -> UIViewController
    
    static let `default` = Navigator()
    
    weak var lastPresented: UIViewController?
    
    private init() {
        // do nothing
    }
    
    func openFlow(_ viewBuilder: Builder) {
        let viewController = viewBuilder()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        lastPresented?.present(navigationController, animated: true) { [weak self] in
            self?.lastPresented = viewController
        }
    }
    
    func pop() {
        lastPresented?.navigationController?.popViewController(animated: true)
        lastPresented = lastPresented?.navigationController?.viewControllers.last
    }
    
    func dismiss() {
        let next = lastPresented?.presentingViewController
        lastPresented?.dismiss(animated: true, completion: { [weak self] in
            self?.lastPresented = next
        })
    }
}
