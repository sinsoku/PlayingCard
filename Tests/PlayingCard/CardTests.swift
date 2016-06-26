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

    func testComparable() {
      /* TODO: Fix later... */
      /* let aceOfSpade = Card<NumberOrder>(rank: .Ace, suit: .Spade) */
      /* let twoOfSpade = Card<NumberOrder>(rank: .Two, suit: .Spade) */
      /* let aceOfHeart = Card<NumberOrder>(rank: .Ace, suit: .Heart) */
      /* XCTAssertEqual(aceOfSpade, aceOfHeart) */
      /* XCTAssertGreaterThan(aceOfSpade, twoOfSpade) */
    }

    static var allTests: [(String, (CardTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testEquatable", testEquatable),
            ("testComparable", testComparable),
        ]
    }
}
