// swift-tools-version: 6.2
import PackageDescription

let release = "0.1.0"
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
            checksum: "b24b5e526194db3b6506cdef3787ace13670508454ee8ac9c96a59f230576bcb"
        ),
        .binaryTarget(
            name: "onnxruntime",
            url: "\(baseURL)/onnxruntime.xcframework.zip",
            checksum: "ae05f97fc7db7346943eedafd47aacea0aca3481c709d7f69817ebf3a37d8367"
        )
    ]
)
