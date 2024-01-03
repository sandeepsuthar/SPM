import XCTest
@testable import SPM

final class SPMTests: XCTestCase {
    func testExample() throws {
        let expectation = self.expectation(description: "Completion should be called")
        let test = TestClass()
        test.fetchData { result in
            switch result {
                case .success(let todo):
                    XCTAssertNotNil(todo.title)
                case .failure(let error):
                    XCTFail("Unexpected failure: \(error)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
