import XCTest
@testable import PlayingCard

class CardTests: XCTestCase {
    func testInit() {
        let card = Card(rank: .Ace, suit: .Spade)
        XCTAssertEqual(card.rank, Rank.Ace)
        XCTAssertEqual(card.suit, Suit.Spade)
    }

    static var allTests: [(String, (CardTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
        ]
    }
}
