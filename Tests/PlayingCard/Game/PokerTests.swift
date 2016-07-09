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

    func testStraightFlush() {
        let cards: Set<CardPc> = Util.factory("3H", "4H", "5H", "6H", "7H")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.StraightFlush)
    }

    func testFourOfAKind() {
        let cards: Set<CardPc> = Util.factory("8S", "8H", "8D", "8C", "2D")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.FourOfAKind)
    }

    func testFullHouse() {
        let cards: Set<CardPc> = Util.factory("6S", "6H", "6C", "3D", "3C")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.FullHouse)
    }

    func testFlush() {
        let cards: Set<CardPc> = Util.factory("13C", "10C", "8C", "5C", "2C")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.Flush)
    }

    func testStraight() {
        let cards: Set<CardPc> = Util.factory("5S", "6D", "7D", "8H", "9C")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.Straight)
    }

    func testThreeOfAKind() {
        let cards: Set<CardPc> = Util.factory("9S", "9H", "9D", "12S", "7C")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.ThreeOfAKind)
    }

    func testTwoPair() {
        let cards: Set<CardPc> = Util.factory("12H", "12C", "2H", "2D", "7C")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.TwoPair)
    }

    func testOnePair() {
        let cards: Set<CardPc> = Util.factory("3D", "3C", "11S", "4H", "1D")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.OnePair)
    }

    func testHighCard() {
        let cards: Set<CardPc> = Util.factory("1D", "10S", "9H", "4D", "3C")
        XCTAssertEqual(Poker.Hand.judge(cards), Poker.Hand.HighCard)
    }

    static var allTests: [(String, (PokerTests) -> () throws -> Void)] {
        return [
            ("testPokerComparing", testPokerComparing),
            ("testRoyalStraightFlush", testRoyalStraightFlush),
            ("testStraightFlush", testStraightFlush),
            ("testFourOfAKind", testFourOfAKind),
            ("testFullHouse", testFullHouse),
            ("testFlush", testFlush),
            ("testStraight", testStraight),
            ("testThreeOfAKind", testThreeOfAKind),
            ("testTwoPair", testTwoPair),
            ("testOnePair", testOnePair),
            ("testHighCard", testHighCard)
        ]
    }
}
