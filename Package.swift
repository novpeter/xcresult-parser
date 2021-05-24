// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCResultParser",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.4.3")
    ],
    targets: [
        .target(
            name: "XCResultParser",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "XCResultParserTests",
            dependencies: ["XCResultParser"]),
    ]
)
