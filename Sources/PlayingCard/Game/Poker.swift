class Poker {
  struct PokerComparing: CardComparable {
      static let suitLevel: Array<Suit> = [.Club, .Diamond, .Heart, .Spade]
      static let rankLevel: Array<Rank> = [.Two, .Three, .Four, .Five, .Six, .Seven, .Eight,
                                           .Nine, .Ten, .Jack, .Queen, .King, .Ace]

      static func equal<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool {
          return lhs.rank == rhs.rank && lhs.suit == rhs.suit
      }

      static func compare<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool {
        return lhs != rhs &&
          (rankLevel.index(of: lhs.rank) < rankLevel.index(of: rhs.rank) ||
           suitLevel.index(of: lhs.suit) < suitLevel.index(of: rhs.suit))
      }
  }
}
