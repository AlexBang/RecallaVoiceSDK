// swift-tools-version: 6.2
import PackageDescription

let release = "0.1.3"
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
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedFramework("Foundation"),
                .linkedFramework("CoreML"),
                .linkedFramework("Accelerate"),
                .linkedFramework("Security"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("Metal"),
                .linkedFramework("QuartzCore")
            ]
        ),
        .binaryTarget(
            name: "RecallaVoiceSDK",
            url: "\(baseURL)/RecallaVoiceSDK.xcframework.zip",
            checksum: "4724defc7779cbf54d14a2e62e7e2575d795c4caf6cc1a0f4721e1e62af1de72"
        ),
        .binaryTarget(
            name: "onnxruntime",
            url: "\(baseURL)/onnxruntime.xcframework.zip",
            checksum: "762b2bc5a0a6f75b05fd047bb1275529e6c9bb05acf3c14e0c836bf39f2066b9"
        )
    ]
)
