struct Card {
  let rank: Rank
  let suit: Suit
}

extension Card: Equatable { }
func == (lhs: Card, rhs: Card) -> Bool {
    return lhs.rank == rhs.rank && lhs.suit == rhs.suit
}
