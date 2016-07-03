import XCTest
@testable import PlayingCard

class CardTests: XCTestCase {
    func testInit() {
        let card = Card<DefaultComparing>(rank: .Ace, suit: .Spade)
        XCTAssertEqual(card.rank, Rank.Ace)
        XCTAssertEqual(card.suit, Suit.Spade)
    }

    func testInitWithString() {
        XCTAssertEqual(Card<DefaultComparing>("1S"), Card<DefaultComparing>(rank: .Ace, suit: .Spade))
        XCTAssertEqual(Card<DefaultComparing>("1H"), Card<DefaultComparing>(rank: .Ace, suit: .Heart))
        XCTAssertEqual(Card<DefaultComparing>("1C"), Card<DefaultComparing>(rank: .Ace, suit: .Club))
        XCTAssertEqual(Card<DefaultComparing>("1D"), Card<DefaultComparing>(rank: .Ace, suit: .Diamond))
        XCTAssertEqual(Card<DefaultComparing>("2S"), Card<DefaultComparing>(rank: .Two, suit: .Spade))
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
            ("testInitWithString", testInitWithString),
            ("testEquatable", testEquatable),
            ("testComparable", testComparable),
        ]
    }
}
