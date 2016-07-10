import XCTest
@testable import PlayingCard

class DeckTests: XCTestCase {
    func testInit() {
        let deck = Deck<DefaultComparing>()
        XCTAssertEqual(deck.cards.count, 52)
        XCTAssertEqual(deck.cards[0], Card<DefaultComparing>("1S"))
        XCTAssertEqual(deck.cards[51], Card<DefaultComparing>("13D"))
    }

    static var allTests: [(String, (DeckTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
        ]
    }
}
