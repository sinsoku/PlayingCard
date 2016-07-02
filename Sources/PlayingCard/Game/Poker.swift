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
          let spadeCards: Set<Card<T>> = [
            Card<T>(rank: .Ten, suit: .Spade),
            Card<T>(rank: .Jack, suit: .Spade),
            Card<T>(rank: .Queen, suit: .Spade),
            Card<T>(rank: .King, suit: .Spade),
            Card<T>(rank: .Ace, suit: .Spade)
          ]
          let heartCards: Set<Card<T>> = [
            Card<T>(rank: .Ten, suit: .Heart),
            Card<T>(rank: .Jack, suit: .Heart),
            Card<T>(rank: .Queen, suit: .Heart),
            Card<T>(rank: .King, suit: .Heart),
            Card<T>(rank: .Ace, suit: .Heart)
          ]
          let clubCards: Set<Card<T>> = [
            Card<T>(rank: .Ten, suit: .Club),
            Card<T>(rank: .Jack, suit: .Club),
            Card<T>(rank: .Queen, suit: .Club),
            Card<T>(rank: .King, suit: .Club),
            Card<T>(rank: .Ace, suit: .Club)
          ]
          let diamondCards: Set<Card<T>> = [
            Card<T>(rank: .Ten, suit: .Diamond),
            Card<T>(rank: .Jack, suit: .Diamond),
            Card<T>(rank: .Queen, suit: .Diamond),
            Card<T>(rank: .King, suit: .Diamond),
            Card<T>(rank: .Ace, suit: .Diamond)
          ]

          if [spadeCards, heartCards, clubCards, diamondCards].contains(cards) {
            return .RoyalStraightFlush
          } else {
            return nil
          }
      }
  }
}
