struct Card<T: CardComparable> {
  let rank: Rank
  let suit: Suit

  init(rank: Rank, suit: Suit) {
    self.rank = rank
    self.suit = suit
  }

  init?(_ value: String) {
    var characters = value.characters
    let suit = characters.popLast()
    let rank = Int(String(characters))

    guard let rankInt = rank where 1...13 ~= rankInt else {
      return nil
    }

    guard let suitStr = suit where ["S", "H", "C", "D"].contains(suitStr) else {
      return nil
    }

    switch suitStr {
      case "S": self = Card<T>(rank: Rank(rawValue: rankInt)!, suit: .Spade)
      case "H": self = Card<T>(rank: Rank(rawValue: rankInt)!, suit: .Heart)
      case "C": self = Card<T>(rank: Rank(rawValue: rankInt)!, suit: .Club)
      case "D": self = Card<T>(rank: Rank(rawValue: rankInt)!, suit: .Diamond)
      default: return nil
    }
  }
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
