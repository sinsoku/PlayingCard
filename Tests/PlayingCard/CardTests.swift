import XCTest
@testable import PlayingCard

class CardTests: XCTestCase {
    func testInit() {
        let card = Card<DefaultComparing>(rank: .Ace, suit: .Spade)
        XCTAssertEqual(card.rank, Rank.Ace)
        XCTAssertEqual(card.suit, Suit.Spade)
    }

    func testEquatable() {
        let card_1 = Card<DefaultComparing>(rank: .Ace, suit: .Spade)
        let card_2 = Card<DefaultComparing>(rank: .Ace, suit: .Spade)
        XCTAssertEqual(card_1, card_2)
    }

    func testComparable() {
      let aceOfHeart = Card<DefaultComparing>(rank: .Ace, suit: .Heart)
      let aceOfSpade = Card<DefaultComparing>(rank: .Ace, suit: .Spade)
      let twoOfSpade = Card<DefaultComparing>(rank: .Two, suit: .Spade)
      XCTAssertGreaterThan(twoOfSpade, aceOfSpade)
      XCTAssertGreaterThan(aceOfSpade, aceOfHeart)
    }

    static var allTests: [(String, (CardTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testEquatable", testEquatable),
            ("testComparable", testComparable),
        ]
    }
}
