class Poker {
  struct PokerComparing: CardComparable {
      static let suitLevel: Array<Suit> = [.Club, .Diamond, .Heart, .Spade]
      static let rankLevel: Array<Rank> = [.Two, .Three, .Four, .Five, .Six, .Seven, .Eight,
                                           .Nine, .Ten, .Jack, .Queen, .King, .Ace]

      static func eq<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool {
          return lhs.rank == rhs.rank && lhs.suit == rhs.suit
      }

      static func lt<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool {
        return lhs != rhs &&
          (rankLevel.index(of: lhs.rank) < rankLevel.index(of: rhs.rank) ||
           suitLevel.index(of: lhs.suit) < suitLevel.index(of: rhs.suit))
      }
  }

  enum Hand: Int {
      case OnePair
      case TwoPair
      case ThreeOfAKind
      case Straight
      case Flush
      case FullHouse
      case FourOfAKind
      case StraightFlush
      case RoyalStraightFlush
      case HighCard

      static func judge<T>(_ cards: Set<Card<T>>) -> Hand {
          if isRoyalStraightFlush(cards) {
            return .RoyalStraightFlush
          } else if isStraightFlush(cards) {
            return .StraightFlush
          } else if isFourOfAKind(cards) {
            return .FourOfAKind
          } else if isFullHouse(cards) {
            return .FullHouse
          } else if isFlush(cards) {
            return .Flush
          } else if isStraight(cards) {
            return .Straight
          } else if isThreeOfAKind(cards) {
            return .ThreeOfAKind
          } else if isTwoPair(cards) {
            return .TwoPair
          } else if isOnePair(cards) {
            return .OnePair
          } else {
            return .HighCard
          }
      }

      private static func isRoyalStraightFlush<T>(_ cards: Set<Card<T>>) -> Bool {
          return [
            Util.factory("10S", "11S", "12S", "13S", "1S"),
            Util.factory("10H", "11H", "12H", "13H", "1H"),
            Util.factory("10C", "11C", "12C", "13C", "1C"),
            Util.factory("10D", "11D", "12D", "13D", "1D")
          ].contains(cards)
      }

      private static func isStraightFlush<T>(_ cards: Set<Card<T>>) -> Bool {
          return isFlush(cards) && isStraight(cards)
      }

      private static func isFourOfAKind<T>(_ cards: Set<Card<T>>) -> Bool {
          var result: Dictionary<Rank, Int> = [:]
          cards.forEach {
              if let value = result[$0.rank] {
                result[$0.rank] = value + 1
              } else {
                result[$0.rank] = 1
              }
          }
          return result.values.contains(4)
      }

      private static func isFullHouse<T>(_ cards: Set<Card<T>>) -> Bool {
          var result: Dictionary<Rank, Int> = [:]
          cards.forEach {
              if let value = result[$0.rank] {
                result[$0.rank] = value + 1
              } else {
                result[$0.rank] = 1
              }
          }
          return result.values.contains(3) && result.values.contains(2)
      }

      private static func isFlush<T>(_ cards: Set<Card<T>>) -> Bool {
        return Set(cards.map { $0.suit }).count == 1
      }

      private static func isStraight<T>(_ cards: Set<Card<T>>) -> Bool {
        let ranks = cards.map { $0.rank.rawValue }.sorted()

        if ranks == [1, 10, 11, 12, 13] {
            return true
        } else {
            return ranks[4] - ranks[0] == 4
        }
      }

      private static func isThreeOfAKind<T>(_ cards: Set<Card<T>>) -> Bool {
          var result: Dictionary<Rank, Int> = [:]
          cards.forEach {
              if let value = result[$0.rank] {
                result[$0.rank] = value + 1
              } else {
                result[$0.rank] = 1
              }
          }
          return result.values.contains(3)
      }

      private static func isTwoPair<T>(_ cards: Set<Card<T>>) -> Bool {
          var result: Dictionary<Rank, Int> = [:]
          cards.forEach {
              if let value = result[$0.rank] {
                result[$0.rank] = value + 1
              } else {
                result[$0.rank] = 1
              }
          }
          return result.filter { $1 == 2 }.count == 2
      }

      private static func isOnePair<T>(_ cards: Set<Card<T>>) -> Bool {
          var result: Dictionary<Rank, Int> = [:]
          cards.forEach {
              if let value = result[$0.rank] {
                result[$0.rank] = value + 1
              } else {
                result[$0.rank] = 1
              }
          }
          return result.filter { $1 == 2 }.count == 1
      }
  }
}
