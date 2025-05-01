//
//  Shared.swift
//  KinKit
//
//  Created by kin on 4/30/25.
//

#if canImport(Foundation)
@_exported import Foundation
#elseif canImport(FoundationEssentials) && !os(macOS) && !os(iOS) && !os(tvOS) && !os(watchOS)
@_exported import FoundationEssentials
#endif
