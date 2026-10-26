// swift-tools-version: 6.2
import PackageDescription

let release = "0.1.2"
let baseURL = "https://github.com/AlexBang/RecallaVoiceSDK/releases/download/\(release)"

let package = Package(
    name: "RecallaVoiceSDK",
    platforms: [.iOS(.v18)],
    products: [
        .library(name: "RecallaVoiceSDK", targets: ["RecallaVoiceSDKPackage"])
    ],
    targets: [
        .target(
            name: "RecallaVoiceSDKPackage",
            dependencies: ["RecallaVoiceSDK", "onnxruntime"],
            linkerSettings: [.linkedLibrary("c++")]
        ),
        .binaryTarget(
            name: "RecallaVoiceSDK",
            url: "\(baseURL)/RecallaVoiceSDK.xcframework.zip",
            checksum: "c386803260836c357506edf2561d43022295dcd323d3095784a13186a6f8a404"
        ),
        .binaryTarget(
            name: "onnxruntime",
            url: "\(baseURL)/onnxruntime.xcframework.zip",
            checksum: "232aa995aef03bd75f95327f7ccf44ae442a5ab1dc6d823f4517edbd6f9571c8"
        )
    ]
)
