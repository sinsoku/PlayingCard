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

      static func judge<T>(_ cards: Set<Card<T>>) -> Hand? {
          if isRoyalStraightFlush(cards) {
            return .RoyalStraightFlush
          } else {
            return nil
          }
      }

      private static func isRoyalStraightFlush<T>(_ cards: Set<Card<T>>) -> Boolean {
          return [
            Util.factory("10S", "11S", "12S", "13S", "1S"),
            Util.factory("10H", "11H", "12H", "13H", "1H"),
            Util.factory("10C", "11C", "12C", "13C", "1C"),
            Util.factory("10D", "11D", "12D", "13D", "1D")
          ].contains(cards)
      }
  }
}
