//
//  Util.swift
//  KinKit
//
//  Created by kin on 6/16/25.
//

import Foundation

#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#endif

public func currentDeviceName() -> String {
    #if os(iOS)
    return UIDevice.current.name
    #elseif os(macOS)
    return Host.current().localizedName ?? "Unknown Mac"
    #elseif os(tvOS)
    return UIDevice.current.name
    #elseif os(watchOS)
    return WKInterfaceDevice.current().name
    #else
    return "Unknown Device"
    #endif
}
