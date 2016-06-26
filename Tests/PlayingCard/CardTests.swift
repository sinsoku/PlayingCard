import XCTest
@testable import PlayingCard

class CardTests: XCTestCase {
    func testInit() {
        let card = Card(rank: .Ace, suit: .Spade)
        XCTAssertEqual(card.rank, Rank.Ace)
        XCTAssertEqual(card.suit, Suit.Spade)
    }

    func testEquatable() {
        let card_1 = Card(rank: .Ace, suit: .Spade)
        let card_2 = Card(rank: .Ace, suit: .Spade)
        XCTAssertEqual(card_1, card_2)
    }

    static var allTests: [(String, (CardTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testEquatable", testEquatable),
        ]
    }
}
