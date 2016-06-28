struct Card<T: CardComparable>: Comparable {
  let rank: Rank
  let suit: Suit
}

func == <T>(lhs: Card<T>, rhs: Card<T>) -> Bool {
    return T.equal(lhs, rhs)
}

func < <T>(lhs: Card<T>, rhs: Card<T>) -> Bool {
    return T.compare(lhs, rhs)
}
