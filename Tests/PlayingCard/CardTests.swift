import XCTest
@testable import PlayingCard

class CardTests: XCTestCase {
    typealias CardDc = Card<DefaultComparing>

    func testInit() {
        let card = CardDc(rank: .Ace, suit: .Spade)
        XCTAssertEqual(card.rank, Rank.Ace)
        XCTAssertEqual(card.suit, Suit.Spade)
    }

    func testInitWithString() {
        XCTAssertEqual(CardDc("1S"), CardDc(rank: .Ace, suit: .Spade))
        XCTAssertEqual(CardDc("1H"), CardDc(rank: .Ace, suit: .Heart))
        XCTAssertEqual(CardDc("1C"), CardDc(rank: .Ace, suit: .Club))
        XCTAssertEqual(CardDc("1D"), CardDc(rank: .Ace, suit: .Diamond))
        XCTAssertEqual(CardDc("2S"), CardDc(rank: .Two, suit: .Spade))
    }

    func testEquatable() {
        let card_1 = CardDc(rank: .Ace, suit: .Spade)
        let card_2 = CardDc(rank: .Ace, suit: .Spade)
        XCTAssertEqual(card_1, card_2)
    }

    func testComparable() {
      let aceOfHeart = CardDc(rank: .Ace, suit: .Heart)
      let aceOfSpade = CardDc(rank: .Ace, suit: .Spade)
      let twoOfSpade = CardDc(rank: .Two, suit: .Spade)
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
