import structs/[ArrayList, List, HashMap]

Tuple: class <K, V> {
    key: K
    value: V

    init: func (=key, =value)
}

operator => <K, V> (key: K, value: V) -> Tuple<K, V> {
    Tuple<K, V> new(key, value)
}

map: func <K, V> (first: Tuple<K, V>, args: ...) -> HashMap<K, V> {
    map := HashMap<K, V> new() 
    map put(first key, first value)
    args each(|arg|
        t := arg as Tuple<K, V>
        map put (t key, t value)
    )
    map
}

list: func <T> (first: T, args: ...) -> List<T> {
    list := ArrayList<T> new(args count + 1)
    list add(first)
    iter := args iterator()
    while (iter hasNext?()) {
        nextType := iter getNextType()
        list add(iter next(T))
    }
    list
}

