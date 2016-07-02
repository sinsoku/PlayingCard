struct Card<T: CardComparable> {
  let rank: Rank
  let suit: Suit
}

extension Card: Hashable {
  var hashValue: Int {
    return rank.hashValue ^ suit.hashValue
  }
}

func == <T>(lhs: Card<T>, rhs: Card<T>) -> Bool {
    return T.eq(lhs, rhs)
}

extension Card: Comparable {}

func < <T>(lhs: Card<T>, rhs: Card<T>) -> Bool {
    return T.lt(lhs, rhs)
}
