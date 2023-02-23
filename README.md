# Swift Dev Container Features:

This repository contains two Features - [`apple-swift-format`](src/swift-format) and [`swiftlint`](src/swiftlint). These install [apple/swift-format](https://github.com/apple/swift-format) and [realm/SwiftLint](https://github.com/realm/SwiftLint) respectively inside of a devcontainer.

## Requirements

Both features need at the very least curl to install. I'd recommend to use the [`common-utils`]{https://github.com/devcontainers/features/tree/main/src/common-utils} feature for the container, or an image that already provides curl.

Depending on the Feature and/or devcontainer setup, the release binary might have to be compiled from source and require more tools to available. For specific information refer to the NOTES.md of the respective Feature.

Compiling from source, as well as setting up an image with Swift in the first place, can take quite some time. I'd heavily recommend using prebuilt images for things like i.e. GitHub Codespaces if you will be creating new containers somewhat regularly, or just don't want to wait a long time on building the container once you need it.
