import XCTest
@testable import PlayingCardTestSuite

XCTMain([
     testCase(CardTests.allTests),
     testCase(RankTests.allTests),
])
