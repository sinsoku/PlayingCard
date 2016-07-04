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
        let spadeCards: Set<CardPc> = Util.factory("10S", "11S", "12S", "13S", "1S")
        XCTAssertEqual(Poker.Hand.judge(spadeCards), Poker.Hand.RoyalStraightFlush)

        let heartCards: Set<CardPc> = Util.factory("10H", "11H", "12H", "13H", "1H")
        XCTAssertEqual(Poker.Hand.judge(heartCards), Poker.Hand.RoyalStraightFlush)

        let clubCards: Set<CardPc> = Util.factory("10C", "11C", "12C", "13C", "1C")
        XCTAssertEqual(Poker.Hand.judge(clubCards), Poker.Hand.RoyalStraightFlush)

        let diamondCards: Set<CardPc> = Util.factory("10D", "11D", "12D", "13D", "1D")
        XCTAssertEqual(Poker.Hand.judge(diamondCards), Poker.Hand.RoyalStraightFlush)
    }

    static var allTests: [(String, (PokerTests) -> () throws -> Void)] {
        return [
            ("testPokerComparing", testPokerComparing),
            ("testRoyalStraightFlush", testRoyalStraightFlush),
        ]
    }
}
