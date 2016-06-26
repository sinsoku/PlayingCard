enum Rank {
    case Ace
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
    case Joker

    static func fromInt(number: Int) -> Rank? {
        switch number {
          case 1: return .Ace
          case 2: return .Two
          case 3: return .Three
          case 4: return .Four
          case 5: return .Five
          case 6: return .Six
          case 7: return .Seven
          case 8: return .Eight
          case 9: return .Nine
          case 10: return .Ten
          case 11: return .Jack
          case 12: return .Queen
          case 13: return .King
          default: return nil
        }
    }

    init?(number: Int) {
      if 1...13 ~= number {
          self = Rank.fromInt(number: number)!
      } else {
          return nil
      }
    }

    func toInt() -> Int? {
        switch self {
          case .Ace: return 1
          case .Two: return 2
          case .Three: return 3
          case .Four: return 4
          case .Five: return 5
          case .Six: return 6
          case .Seven: return 7
          case .Eight: return 8
          case .Nine: return 9
          case .Ten: return 10
          case .Jack: return 11
          case .Queen: return 12
          case .King: return 13
          case .Joker: return nil
        }
    }
}
