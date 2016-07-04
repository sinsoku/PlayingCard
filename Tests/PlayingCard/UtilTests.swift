import XCTest
@testable import PlayingCard

class UtilTests: XCTestCase {
    typealias CardDc = Card<DefaultComparing>

    func testFactoryForSet() {
      let cards: Set<CardDc> = Util.factory("1S", "2S", "1S")
      XCTAssertEqual(cards.count, 2)
      XCTAssertTrue(cards.contains(CardDc("1S")!))
      XCTAssertTrue(cards.contains(CardDc("2S")!))
    }

    static var allTests: [(String, (UtilTests) -> () throws -> Void)] {
        return [
            ("testFactoryForSet", testFactoryForSet),
        ]
    }
}
