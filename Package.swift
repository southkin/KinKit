// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KinKit",
    platforms: [
        .macOS(.v12),
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "KinKit",
            targets: ["Shared","KinKit"]),
    ],
    targets: [
        .target(
            name: "Shared"
        ),
        .target(
            name: "KinKit"
        )
    ]
)
