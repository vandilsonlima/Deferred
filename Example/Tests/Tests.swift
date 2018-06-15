import XCTest
import Deferred

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }

    private func asyncTask() -> Deferred<Int> {
        let deferred = Deferred<Int>()
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            deferred.value = 1
        }
        return deferred
    }
    
    func testExemple() {
        let exp = expectation(description: "")

        async {
            let value = self.asyncTask().await().value
            XCTAssert(value == 1)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1)
    }

}
