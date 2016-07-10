struct Deck<T: CardComparable> {
    let cards: Array<Card<T>> = {
      return (1...13).map {
        [
          Card<T>(rank: Rank(rawValue: $0)!, suit: .Spade),
          Card<T>(rank: Rank(rawValue: $0)!, suit: .Heart),
          Card<T>(rank: Rank(rawValue: $0)!, suit: .Club),
          Card<T>(rank: Rank(rawValue: $0)!, suit: .Diamond)
        ]
      }.flatMap { $0 }
    }()
}
