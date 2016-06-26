import XCTest
@testable import PlayingCard

class RankTests: XCTestCase {
    func testFromInt() {
        XCTAssertEqual(Rank.fromInt(number: 1), Rank.Ace)
        XCTAssertEqual(Rank.fromInt(number: 13), Rank.King)
        XCTAssertNil(Rank.fromInt(number: 14))
    }

    func testInitWithNumber() {
        XCTAssertEqual(Rank(number: 1), Rank.Ace)
        XCTAssertEqual(Rank(number: 13), Rank.King)
        XCTAssertNil(Rank(number: 14))
    }

    func testToInt() {
        XCTAssertEqual(Rank.Ace.toInt(), 1)
        XCTAssertEqual(Rank.King.toInt(), 13)
        XCTAssertNil(Rank.Joker.toInt())
    }

    static var allTests: [(String, (RankTests) -> () throws -> Void)] {
        return [
            ("testFromInt", testFromInt),
            ("testInitWithNumber", testInitWithNumber),
            ("testToInt", testToInt),
        ]
    }
}
