// swift-tools-version:4.2
// Managed by ice

import PackageDescription

let package = Package(
    name: "LKAlphaKit",
    products: [
        .library(name: "LKAlphaKit", targets: ["LKAlphaKit"]),
		.library(name: "LKLightKit", targets: ["LKLightKit"]),
		.library(name: "ORSSerialPort", targets: ["ORSSerialPort"])
    ],

	dependencies: [
		.package(url: "https://github.com/leka/LKAlphaComSpecs", from: "3.0.0"),
	]
)

// MARK: - Target - LKAlphaKit

package.targets += [
	.target(name: "LKAlphaKit", dependencies: []),
	.testTarget(name: "LKAlphaKitTests", dependencies: ["LKAlphaKit"]),
]

// MARK: - Target - LKIOKit

package.targets += [
	.target(name: "LKIOKit", dependencies: ["LKAlphaComSpecs", "LKSupport"]),
	.testTarget(name: "LKIOKitTests", dependencies: ["LKIOKit"]),
]

// MARK: - Target - LKLightKit

package.targets += [
	.target(name: "LKLightKit", dependencies: ["LKAlphaComSpecs", "LKIOKit"]),
	.testTarget(name: "LKLightKitTests", dependencies: ["LKLightKit"]),
]

// MARK: - Target - LKSupport

package.targets += [
	.target(name: "LKSupport", dependencies: []),
	.testTarget(name: "LKSupportTests", dependencies: ["LKSupport"]),
]

// MARK: - Target - Libraries

package.targets += [
	.target(name: "ORSSerialPort", dependencies: [], path: "Libraries/ORSSerialPort"),
]

// MARK: - Swift Version

package.swiftLanguageVersions = [.v4, .v4_2]
