
import Foundation

enum Exercise3RepositoryError: Swift.Error {
    case httpError(httpCode: Int)
    case noUsers
}

protocol Exercise3Repository {
    
    /**
     Recover the list users from the server
     - Throws: could throws Exercise3RepositoryError.httpError if http communication fails
     - Throws: could throws Exercise3RepositoryError.noUsers if server has not registered users
     */
    func users() async throws -> [InnocvUser]
    
}
