struct DefaultComparing: CardComparable {
    static func eq<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool {
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }

    // Spade > Heart > Club > Diamond
    // K > Q > ... > 2 > A
    static func lt<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool {
        return lhs != rhs &&
          (lhs.rank.rawValue < rhs.rank.rawValue || lhs.suit.rawValue > rhs.suit.rawValue)
    }
}
