// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "QiNiu",
    products: [
        .library(name: "QiNiu", targets: ["QiNiu"]),
    ],
    targets: [
        .target(
            name: "QiNiu",
            dependencies: []),
        .testTarget(
            name: "QiNiuTests",
            dependencies: ["QiNiu"]),
    ]
)
