//
//  DecimalExtension.swift
//  KinKit
//
//  Created by kin on 4/30/25.
//

public extension Decimal {
    func rounded(scale: Int = 0, mode: NSDecimalNumber.RoundingMode = .plain) -> Decimal {
        let handler = NSDecimalNumberHandler(
            roundingMode: mode,
            scale: Int16(scale),
            raiseOnExactness: false,
            raiseOnOverflow: false,
            raiseOnUnderflow: false,
            raiseOnDivideByZero: false
        )
        let number = self as NSDecimalNumber
        return number.rounding(accordingToBehavior: handler) as Decimal
    }
}
