//
//  DictionaryExtension.swift
//  KinKit
//
//  Created by kin on 4/30/25.
//


public extension Dictionary {
    var queryString: String {
        return self.map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return "\(escapedKey)=\(escapedValue)"
        }.joined(separator: "&")
    }
}
