import XCTest
@testable import PlayingCard

class PokerTests: XCTestCase {
    func testPokerComparing() {
        let aceOfSpade = Card<Poker.PokerComparing>(rank: .Ace, suit: .Spade)
        let aceOfHeart = Card<Poker.PokerComparing>(rank: .Ace, suit: .Heart)
        let aceOfDiamond = Card<Poker.PokerComparing>(rank: .Ace, suit: .Diamond)
        let aceOfClub = Card<Poker.PokerComparing>(rank: .Ace, suit: .Club)

        XCTAssertGreaterThan(aceOfSpade, aceOfHeart)
        XCTAssertGreaterThan(aceOfSpade, aceOfDiamond)
        XCTAssertGreaterThan(aceOfSpade, aceOfClub)
        XCTAssertGreaterThan(aceOfHeart, aceOfDiamond)
        XCTAssertGreaterThan(aceOfHeart, aceOfClub)
        XCTAssertGreaterThan(aceOfDiamond, aceOfClub)

        let twoOfSpade = Card<Poker.PokerComparing>(rank: .Two, suit: .Spade)
        XCTAssertGreaterThan(aceOfSpade, twoOfSpade)

        let threeOfSpade = Card<Poker.PokerComparing>(rank: .Three, suit: .Spade)
        XCTAssertGreaterThan(threeOfSpade, twoOfSpade)
    }

    static var allTests: [(String, (PokerTests) -> () throws -> Void)] {
        return [
            ("testPokerComparing", testPokerComparing),
        ]
    }
}
