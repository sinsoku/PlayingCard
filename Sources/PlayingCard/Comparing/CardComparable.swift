protocol CardComparable {
    static func equal<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool
    static func compare<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool
}
