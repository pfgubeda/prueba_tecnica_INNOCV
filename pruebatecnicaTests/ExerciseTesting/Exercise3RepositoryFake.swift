
import Foundation
@testable import pruebatecnica

class Exercise3RepositoryHttpError: Exercise3Repository {
    
    func users() async throws -> [InnocvUser] {
        throw Exercise3RepositoryError.httpError(httpCode: 401)
    }
}

class Exercise3RepositoryNoUsersError: Exercise3Repository {
    
    func users() async throws -> [InnocvUser] {
        throw Exercise3RepositoryError.noUsers
    }
}

class Exercise3RepositoryUsers: Exercise3Repository {
    
    func users() async throws -> [InnocvUser] {
        [
            InnocvUser(id: 0, name: "Carla"),
            InnocvUser(id: 1, name: "Tatoh"),
            InnocvUser(id: 2, name: "Ibai")
        ]
    }
}
