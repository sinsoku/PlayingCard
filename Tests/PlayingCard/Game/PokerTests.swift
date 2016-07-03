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
          CardPc("10S")!, CardPc("11S")!, CardPc("12S")!, CardPc("13S")!, CardPc("1S")!
        ]
        XCTAssertEqual(Poker.Hand.judge(spadeCards), Poker.Hand.RoyalStraightFlush)

        let heartCards: Set<CardPc> = [
          CardPc("10H")!, CardPc("11H")!, CardPc("12H")!, CardPc("13H")!, CardPc("1H")!
        ]
        XCTAssertEqual(Poker.Hand.judge(heartCards), Poker.Hand.RoyalStraightFlush)

        let clubCards: Set<CardPc> = [
          CardPc("10C")!, CardPc("11C")!, CardPc("12C")!, CardPc("13C")!, CardPc("1C")!
        ]
        XCTAssertEqual(Poker.Hand.judge(clubCards), Poker.Hand.RoyalStraightFlush)

        let diamondCards: Set<CardPc> = [
          CardPc("10D")!, CardPc("11D")!, CardPc("12D")!, CardPc("13D")!, CardPc("1D")!
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
