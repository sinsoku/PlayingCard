import XCTest
@testable import PlayingCardTestSuite

XCTMain([
     testCase(CardTests.allTests),
     testCase(RankTests.allTests),
     testCase(PokerTests.allTests),
     testCase(UtilTests.allTests),
     testCase(DeckTests.allTests),
])
