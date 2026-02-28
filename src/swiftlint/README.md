
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

Additionally, to actually run `swiftlint`, the Swift runtime has to be available inside of the container.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/LosFarmosCTL/swift-devcontainer-features/blob/main/src/swiftlint/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
