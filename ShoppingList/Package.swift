// manual creation
//
import PackageDescription

let package = Package(
    name: "ShoppingList",
    targets: [
    ],
    dependencies: [
        Package.Dependency.Package(url: "https://github.com/SwiftORM/MongoDB-StORM.git",
                                   versions: Version(3,0,0)..<Version(3,9,9)),
        Package.Dependency.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
                                   versions: Version(3,0,0)..<Version(3,9,9)),
//        Package.Dependency.Package(url: "https://github.com/thinkaboutiter/SimpleLogger.git",
//                                   versions: Version(1,0,0)..<Version(1,9,9))
        ]
)
