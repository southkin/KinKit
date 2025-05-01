//
//  IntExtension.swift
//  KinKit
//
//  Created by kin on 5/1/25.
//


public extension Int {
    var string:String {
        "\(self)"
    }
    var decimal:Decimal {
        Decimal(string: self.string) ?? 0
    }
}
