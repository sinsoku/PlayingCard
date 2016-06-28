enum Rank: Int {
    case Ace = 1
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King

    init?(_ number: Int) {
      if 1...13 ~= number {
          self = Rank(rawValue: number)!
      } else {
          return nil
      }
    }
}
