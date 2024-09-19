
import Foundation

enum Exercise3Result {
    // Array with the user names
    case users([String])
    // Message to be printed
    case error(String)
}

protocol Exercise3Interactor {
    
    /**
     Return a list of users loaded from the server or an error
     if anything happen
     */
    func execute() async -> Exercise3Result
}

class Exercise3InteractorDefault: Exercise3Interactor {
    
    private let repository: Exercise3Repository
    
    init(repository: Exercise3Repository) {
        self.repository = repository
    }
    
    func execute() async -> Exercise3Result {
        // todo: Implementa tu solución aquí
        fatalError("Complete your implementation here")
    }
}
