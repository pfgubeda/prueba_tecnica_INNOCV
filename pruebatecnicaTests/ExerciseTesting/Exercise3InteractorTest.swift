
import Foundation
import XCTest
@testable import pruebatecnica

class Exercise3InteractorTest: XCTestCase {
    
    // todo: Rellena tus test unitarios aquí
    
    // MARK: Solucion
    func test_http_error_check() {
        let sut = Exercise3InteractorDefault(repository: Exercise3RepositoryHttpError())
        
        runAsyncTest {
            if case let Exercise3Result.error(message) = await sut.execute() {
                XCTAssertEqual("Error http 401", message)
            } else {
                XCTFail("Unsupported error")
            }
        }
    }
    
    func test_http_no_users_check() {
        let sut = Exercise3InteractorDefault(repository: Exercise3RepositoryNoUsersError())
        
        runAsyncTest {
            if case let Exercise3Result.error(message) = await sut.execute() {
                XCTAssertEqual("Ha ocurrido un error inesperado", message)
            } else {
                XCTFail("Unsupported error")
            }
        }
    }
    
    func test_http_users_names_check() {
        let sut = Exercise3InteractorDefault(repository: Exercise3RepositoryUsers())
        
        runAsyncTest {
            if case let Exercise3Result.users(users) = await sut.execute() {
                XCTAssertEqual(3, users.count)
                XCTAssertEqual("Carla", users[0])
                XCTAssertEqual("Tatoh", users[1])
                XCTAssertEqual("Ibai", users[2])
            } else {
                XCTFail("Unsupported error")
            }
        }
    }
}
