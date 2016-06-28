import XCTest
@testable import PlayingCard

class RankTests: XCTestCase {
    func testInitWithNumber() {
        XCTAssertEqual(Rank(1), Rank.Ace)
        XCTAssertEqual(Rank(13), Rank.King)
        XCTAssertNil(Rank(14))
    }

    static var allTests: [(String, (RankTests) -> () throws -> Void)] {
        return [
            ("testInitWithNumber", testInitWithNumber),
        ]
    }
}
