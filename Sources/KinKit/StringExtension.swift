//
//  StringExtension.swift
//  KinKit
//
//  Created by kin on 5/7/25.
//

import CryptoKit

public extension String {
    var sha256: String {
        guard let data = self.data(using: .utf8) else { return self }
        return SHA256.hash(data: data).compactMap { String(format: "%02x", $0) }.joined()
    }
}
