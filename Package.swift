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
            name: "KinKitCore",
            targets: ["KinKitCore"]),
        .library(
            name: "KinKit",
            targets: ["KinKit"]),
//        .library(
//            name: "KinKit_OtherPlatform",
//            targets: ["KinKit_OtherPlatform"]),
    ],
    targets: [
        .target(
            name: "KinKitCore"
        ),
        .target(
            name: "KinKit",
            dependencies: ["KinKitCore"]
        ),
//        .target(
//            name: "KinKit_OtherPlatform",
//            dependencies: ["Shared"]
//        )
    ]
)
