//
//  SequenceExtension.swift
//  KinKit
//
//  Created by kin on 6/27/25.
//

public extension Sequence where Element: Hashable {
    var asSet: Set<Element> {
        Set(self)
    }
}

public extension Sequence {
    func toSet<Key: Hashable>(_ transform: (Element) -> Key) -> Set<Key> {
        Set(self.map(transform))
    }
}
