
import XCTest

extension XCTestCase {
    
    /**
     Run an async block into a unit testing. Basically you could use it
     in the following way:
     
     ```swift
     func test_to_execute() throws {
        let sut = MyAsyncInteractor()
        runAsyncTest {
            let result = await sut.execute()
            // here goes your validations
        }
     }
     ```
     - parameter testName: The name of the test (optional)
     - parameter file: The file name (optional)
     - parameter line: The line of code where test are located (optional)
     - parameter timeout: A maximum timeout (10 seconds by default)
     - parameter test: The async-await block where your awaits will be located
     */
    func runAsyncTest(
        named testName: String = #function,
        in file: StaticString = #file,
        at line: UInt = #line,
        withTimeout timeout: TimeInterval = 10,
        test: @escaping () async throws -> Void
    ) {
        var thrownError: Error?
        let errorHandler = { thrownError = $0 }
        let expectation = expectation(description: testName)

        Task {
            do {
                try await test()
            } catch {
                errorHandler(error)
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: timeout)

        if let error = thrownError {
            XCTFail(
                "Async error thrown: \(error)",
                file: file,
                line: line
            )
        }
    }
}
