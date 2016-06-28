protocol CardComparable {
    static func eq<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool
    static func lt<T>(_ lhs: Card<T>, _ rhs: Card<T>) -> Bool
}
