struct Card<T: CardComparable>: Comparable {
  let rank: Rank
  let suit: Suit
}

func == <T>(lhs: Card<T>, rhs: Card<T>) -> Bool {
    return T.eq(lhs, rhs)
}

func < <T>(lhs: Card<T>, rhs: Card<T>) -> Bool {
    return T.lt(lhs, rhs)
}
