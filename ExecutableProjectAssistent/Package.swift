// swift-tools-version:4.0
// Generated automatically by Perfect Assistant 2
// Date: 2018-02-20 14:14:39 +0000
import PackageDescription

let package = Package(
	name: "ExecutableProjectAssistent",
	dependencies: [
		.package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", "3.0.0"..<"4.0.0")
	],
	targets: [
		.target(
            name: "ExecutableProjectAssistent",
            dependencies: [
                "PerfectHTTPServer"
            ])
	]
)
