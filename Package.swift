// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "QiNiu",

    products: [
        .library(name: "QiNiu", targets: ["QiNiu"]),
    ],
    dependencies: [
      .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "0.8.0")
    ],
    targets: [
        .target(
            name: "QiNiu",
            dependencies: ["CryptoSwift"]),
        .testTarget(
            name: "QiNiuTests",
            dependencies: ["QiNiu"]),
    ]
)
