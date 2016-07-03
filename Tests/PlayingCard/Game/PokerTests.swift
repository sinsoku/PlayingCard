import XCTest
@testable import PlayingCard

class PokerTests: XCTestCase {
    typealias CardPc = Card<Poker.PokerComparing>

    func testPokerComparing() {
        let aceOfSpade = CardPc(rank: .Ace, suit: .Spade)
        let aceOfHeart = CardPc(rank: .Ace, suit: .Heart)
        let aceOfDiamond = CardPc(rank: .Ace, suit: .Diamond)
        let aceOfClub = CardPc(rank: .Ace, suit: .Club)

        XCTAssertGreaterThan(aceOfSpade, aceOfHeart)
        XCTAssertGreaterThan(aceOfSpade, aceOfDiamond)
        XCTAssertGreaterThan(aceOfSpade, aceOfClub)
        XCTAssertGreaterThan(aceOfHeart, aceOfDiamond)
        XCTAssertGreaterThan(aceOfHeart, aceOfClub)
        XCTAssertGreaterThan(aceOfDiamond, aceOfClub)

        let twoOfSpade = CardPc(rank: .Two, suit: .Spade)
        XCTAssertGreaterThan(aceOfSpade, twoOfSpade)

        let threeOfSpade = CardPc(rank: .Three, suit: .Spade)
        XCTAssertGreaterThan(threeOfSpade, twoOfSpade)
    }

    func testRoyalStraightFlush() {
        let spadeCards: Set<CardPc> = [
          CardPc(rank: .Ten, suit: .Spade),
          CardPc(rank: .Jack, suit: .Spade),
          CardPc(rank: .Queen, suit: .Spade),
          CardPc(rank: .King, suit: .Spade),
          CardPc(rank: .Ace, suit: .Spade)
        ]
        XCTAssertEqual(Poker.Hand.judge(spadeCards), Poker.Hand.RoyalStraightFlush)

        let heartCards: Set<CardPc> = [
          CardPc(rank: .Ten, suit: .Heart),
          CardPc(rank: .Jack, suit: .Heart),
          CardPc(rank: .Queen, suit: .Heart),
          CardPc(rank: .King, suit: .Heart),
          CardPc(rank: .Ace, suit: .Heart)
        ]
        XCTAssertEqual(Poker.Hand.judge(heartCards), Poker.Hand.RoyalStraightFlush)

        let clubCards: Set<CardPc> = [
          CardPc(rank: .Ten, suit: .Club),
          CardPc(rank: .Jack, suit: .Club),
          CardPc(rank: .Queen, suit: .Club),
          CardPc(rank: .King, suit: .Club),
          CardPc(rank: .Ace, suit: .Club)
        ]
        XCTAssertEqual(Poker.Hand.judge(clubCards), Poker.Hand.RoyalStraightFlush)

        let diamondCards: Set<CardPc> = [
          CardPc(rank: .Ten, suit: .Diamond),
          CardPc(rank: .Jack, suit: .Diamond),
          CardPc(rank: .Queen, suit: .Diamond),
          CardPc(rank: .King, suit: .Diamond),
          CardPc(rank: .Ace, suit: .Diamond)
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
