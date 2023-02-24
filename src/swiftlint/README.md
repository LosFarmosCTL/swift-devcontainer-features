
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
| fromSource | Always install SwiftLint from source instead of using a pre-built binary, even if one is available. | boolean | false |

## Requirements

SwiftLint only provides binary releases for x86_64, so for all other containers, it will be compiled from source.

If the release binary is used, the following tools have to be available:

1. `curl`
2. `sed`

Additionally, to actually run `swiftlint`, the Swift runtime has to be available inside of the container.

If `swiftlint` has to be compiled from source, these tools are required additionally:

3. `git`
4. `swift`

A good container template that fulfills all requirements would be the [`swift-devcontainer-template`](https://github.com/swift-server/swift-devcontainer-template) maintained by the official Swift Server workgroup.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/LosFarmosCTL/swift-devcontainer-features/blob/main/src/swiftlint/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
