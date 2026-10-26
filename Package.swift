// swift-tools-version: 6.2
import PackageDescription

let release = "0.1.1"
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
            checksum: "dec52e2d367ee1b80c2a715214fb739a55a4d392747b03578dc51ba7fa20400f"
        ),
        .binaryTarget(
            name: "onnxruntime",
            url: "\(baseURL)/onnxruntime.xcframework.zip",
            checksum: "59e899880a3b7fa8a2994d8f92d4fe120c4fbf555c190e642686e2e5996b4c95"
        )
    ]
)
