// Generated automatically by Perfect Assistant Application
// Date: 2018-02-22 13:46:50 +0000
import PackageDescription
let package = Package(
	name: "BubblyChatServer",
	targets: [],
	dependencies: [
		.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 3),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-WebSockets.git", majorVersion: 3),
		.Package(url: "https://github.com/SwiftORM/MongoDB-StORM.git", majorVersion: 3),
        .Package(url: "https://github.com/apple/swift-protobuf.git", majorVersion: 1),
        .Package(url: "https://github.com/thinkaboutiter/SimpleLogger.git", majorVersion: 1)
	]
)
