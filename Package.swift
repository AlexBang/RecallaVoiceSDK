// swift-tools-version: 6.2
import PackageDescription

let release = "0.1.4"
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
            checksum: "03f44e41e8890b5d53922a2b5afbaeb6093ec02621dad0c70270e8c93744ae5e"
        ),
        .binaryTarget(
            name: "onnxruntime",
            url: "\(baseURL)/onnxruntime.xcframework.zip",
            checksum: "d56e9e026b5eeb8dd9bdc849c050de4df991e4dd2ecfce81434873ca22b28267"
        )
    ]
)
