# RecallaVoiceSDK

On-device enrolled-speaker extraction for iOS 18+. The package ships the
MossFormer2 separator, the SpeechBrain ECAPA voiceprint model, and ONNX Runtime.
Audio stays on the device.

## Add with Swift Package Manager

In Xcode, choose **File > Add Package Dependencies...**, enter:

```text
https://github.com/AlexBang/RecallaVoiceSDK.git
```

Select the `RecallaVoiceSDK` product and add it to the app target. The package
downloads its versioned binary artifacts from this repository's GitHub Release.

```swift
import RecallaVoiceSDK

let extractor = RecallaVoiceExtractor(model: try MossFormerPrimarySpeakerModel())
let voiceprint = try await extractor.enroll(from: enrollmentPCM)
let targetOnly = try await extractor.extract(
    from: recordingPCM,
    voiceprint: voiceprint
)
```

`VoicePCM16Audio` accepts mono signed-16-bit PCM. The SDK resamples internally
when its models require another rate.

## Distribution

The binary artifacts are release assets so applications do not need Git LFS.
The matching source package is maintained separately by the Recalla team.

## Minimum platform

iOS 18.0.
