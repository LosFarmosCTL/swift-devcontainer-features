
# swift-format (apple-swift-format)

Installs Apple's own formatter for swift code, swift-format, built from source.

## Example Usage

```json
"features": {
    "ghcr.io/LosFarmosCTL/swift-devcontainer-features/apple-swift-format:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | The version of swift-format to install (depends on the installed Swift version, main should only be used for pre-release Swift snapshots). | string | latest |

## Requirements

Since there are no suitable binary releases available, `swift-format` is always compiled from source. Therefore the devcontainer needs to include the following tools:

1. `git`
2. `swift` (The version of Swift that is used in the container determines what version of swift-format should be installed. For details on which versions match refer to the [swift-format README](https://github.com/apple/swift-format#matching-swift-format-to-your-swift-version-swift-57-and-earlier))
3. `curl` and `sed` (Only if `latest` is used, needed to check GitHub releases)

A good container template that fulfills all requirements would be the [`swift-devcontainer-template`](https://github.com/swift-server/swift-devcontainer-template) maintained by the official Swift Server workgroup.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/LosFarmosCTL/swift-devcontainer-features/blob/main/src/apple-swift-format/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
