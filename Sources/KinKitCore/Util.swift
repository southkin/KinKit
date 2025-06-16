//
//  Util.swift
//  KinKit
//
//  Created by kin on 6/16/25.
//

import Foundation

public func currentDeviceName() -> String {
    #if os(iOS)
    import UIKit
    return UIDevice.current.name
    #elseif os(macOS)
    return Host.current().localizedName ?? "Unknown Mac"
    #elseif os(tvOS)
    return UIDevice.current.name
    #elseif os(watchOS)
    import WatchKit
    return WKInterfaceDevice.current().name
    #else
    return "Unknown Device"
    #endif
}
