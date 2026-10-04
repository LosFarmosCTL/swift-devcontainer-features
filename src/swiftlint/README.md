
# SwiftLint (swiftlint)

Installs realm/SwiftLint, a widely used tool for checking Swift code style violations.

## Example Usage

```json
"features": {
    "ghcr.io/LosFarmosCTL/swift-devcontainer-features/swiftlint:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | The version of SwiftLint to install. | string | latest |

## Requirements

For installation, the following tools have to be available:

1. `curl`
2. `sed`
3. `unzip`

To run `swiftlint`, the container needs a Swift toolchain including SourceKit (`libsourcekitdInProc.so`) and `libxml2.so.2`.

Use a compatible base image such as `swift:6.4-noble` (Ubuntu 24.04). Ubuntu 26.04 images, including the current `swift:latest`, provide `libxml2.so.16`, which does not satisfy the prebuilt SwiftLint binaries' requirement for `libxml2.so.2`.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/LosFarmosCTL/swift-devcontainer-features/blob/main/src/swiftlint/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
