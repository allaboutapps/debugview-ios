// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DebugView",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "DebugView",
            targets: ["DebugView"]
        ),
    ],
    targets: [
        .target(
            name: "DebugView"
        ),
        .testTarget(
            name: "DebugViewTests",
            dependencies: ["DebugView"]
        ),
    ]
)
