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

    func testRoyalStraightFlush() {
        let spadeCards: Set<Card<Poker.PokerComparing>> = [
          Card<Poker.PokerComparing>(rank: .Ten, suit: .Spade),
          Card<Poker.PokerComparing>(rank: .Jack, suit: .Spade),
          Card<Poker.PokerComparing>(rank: .Queen, suit: .Spade),
          Card<Poker.PokerComparing>(rank: .King, suit: .Spade),
          Card<Poker.PokerComparing>(rank: .Ace, suit: .Spade)
        ]
        XCTAssertEqual(Poker.Hand.judge(spadeCards), Poker.Hand.RoyalStraightFlush)

        let heartCards: Set<Card<Poker.PokerComparing>> = [
          Card<Poker.PokerComparing>(rank: .Ten, suit: .Heart),
          Card<Poker.PokerComparing>(rank: .Jack, suit: .Heart),
          Card<Poker.PokerComparing>(rank: .Queen, suit: .Heart),
          Card<Poker.PokerComparing>(rank: .King, suit: .Heart),
          Card<Poker.PokerComparing>(rank: .Ace, suit: .Heart)
        ]
        XCTAssertEqual(Poker.Hand.judge(heartCards), Poker.Hand.RoyalStraightFlush)

        let clubCards: Set<Card<Poker.PokerComparing>> = [
          Card<Poker.PokerComparing>(rank: .Ten, suit: .Club),
          Card<Poker.PokerComparing>(rank: .Jack, suit: .Club),
          Card<Poker.PokerComparing>(rank: .Queen, suit: .Club),
          Card<Poker.PokerComparing>(rank: .King, suit: .Club),
          Card<Poker.PokerComparing>(rank: .Ace, suit: .Club)
        ]
        XCTAssertEqual(Poker.Hand.judge(clubCards), Poker.Hand.RoyalStraightFlush)

        let diamondCards: Set<Card<Poker.PokerComparing>> = [
          Card<Poker.PokerComparing>(rank: .Ten, suit: .Diamond),
          Card<Poker.PokerComparing>(rank: .Jack, suit: .Diamond),
          Card<Poker.PokerComparing>(rank: .Queen, suit: .Diamond),
          Card<Poker.PokerComparing>(rank: .King, suit: .Diamond),
          Card<Poker.PokerComparing>(rank: .Ace, suit: .Diamond)
        ]
        XCTAssertEqual(Poker.Hand.judge(diamondCards), Poker.Hand.RoyalStraightFlush)
    }

    static var allTests: [(String, (PokerTests) -> () throws -> Void)] {
        return [
            ("testPokerComparing", testPokerComparing),
            ("testRoyalStraightFlush", testRoyalStraightFlush),
        ]
    }
}
