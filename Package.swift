// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SaundappWidgetsbridge",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SaundappWidgetsbridge",
            targets: ["WidgetsBridgePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "WidgetsBridgePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/WidgetsBridgePlugin")
    ]
)
