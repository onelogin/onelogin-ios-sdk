// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "OneLoginSDKiOS",
    // The prebuilt framework's minimum deployment target is iOS 16.2.
    platforms: [.iOS("16.2")],
    products: [
        .library(name: "OneLoginSDKiOS", targets: ["OneLoginSDKiOSWrapper"]),
    ],
    dependencies: [
        // OneLoginSDKiOS.xcframework already contains Alamofire 5.4.4 and RxSwift 5.1.3,
        // but its public interface imports both modules, so apps need them to compile.
        // RxSwift is pinned because the SDK's API returns RxSwift.Observable values.
        // Alamofire can float: the only Alamofire type in the API is the
        // RequestInterceptor protocol.
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.4"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "5.1.3"),
    ],
    targets: [
        .binaryTarget(
            name: "OneLoginSDKiOS",
            path: "OneLoginSDKiOS/OneLoginSDKiOS.xcframework"
        ),
        // A binary target can't declare dependencies, so this wrapper brings in the
        // framework together with the modules its interface imports.
        .target(
            name: "OneLoginSDKiOSWrapper",
            dependencies: [
                "OneLoginSDKiOS",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "RxSwift", package: "RxSwift"),
            ]
        ),
        .testTarget(
            name: "OneLoginSDKiOSTests",
            dependencies: [
                "OneLoginSDKiOSWrapper",
                .product(name: "RxSwift", package: "RxSwift"),
            ]
        ),
    ]
)
