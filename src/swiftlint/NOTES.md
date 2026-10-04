## Requirements

For installation, the following tools have to be available:

1. `curl`
2. `sed`
3. `unzip`

To run `swiftlint`, the container needs a Swift toolchain including SourceKit (`libsourcekitdInProc.so`) and `libxml2.so.2`.

Use a compatible base image such as `swift:6.4-noble` (Ubuntu 24.04). Ubuntu 26.04 images, including the current `swift:latest`, provide `libxml2.so.16`, which does not satisfy the prebuilt SwiftLint binaries' requirement for `libxml2.so.2`.
