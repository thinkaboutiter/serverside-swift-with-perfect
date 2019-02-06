// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShoppingList",
    dependencies: [
        // .package(url: "https://github.com/SwiftORM/MongoDB-StORM.git", from: "3.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
        // .package(url: "https://github.com/thinkaboutiter/SimpleLogger.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "ShoppingList",
            dependencies: [
                "PerfectHTTPServer",
                // "MongoDBStORM",
            ],
            path: "Sources"),
    ]
)
