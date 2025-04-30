// The Swift Programming Language
// https://docs.swift.org/swift-book

#if canImport(Foundation)
@_exported import Foundation
#elseif canImport(FoundationEssentials) && !os(macOS) && !os(iOS) && !os(tvOS) && !os(watchOS)
@_exported import FoundationEssentials
#endif
