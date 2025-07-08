//
//  Util.swift
//  KinKit
//
//  Created by kin on 6/16/25.
//

import Foundation

#if os(iOS) || os(padOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#endif

@MainActor
public func currentDeviceName() -> String {
    #if os(iOS) || os(padOS)
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

public func debugLog(
    _ items: Any...,
    separator: String = " ",
    terminator: String = "\n",
    file: String = #file,
    function: String = #function,
    line: Int = #line
) {
    // 파일명만 떼기
    let filename = (file as NSString).lastPathComponent
    // items 합치기
    let message = items.map { "\($0)" }.joined(separator: separator)
    // 최종 포맷
    Swift.print("[\(filename):\(line) \(function)] \(message)", terminator: terminator)
}
