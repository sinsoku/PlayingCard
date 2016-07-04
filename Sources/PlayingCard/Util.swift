class Util {
    // TODO: Remove CardInitializeable
    // TODO: Support the return value by Array
    static func factory<C: CardInitializeable>(_ values: String...) -> Set<C> {
      let cards = values.map { C($0)! }
      return Set(cards)
    }
}
