[![CI - Test Features](https://github.com/LosFarmosCTL/swift-devcontainer-features/actions/workflows/test.yaml/badge.svg)](https://github.com/LosFarmosCTL/swift-devcontainer-features/actions/workflows/test.yaml)

# Swift Dev Container Features

This repository contains two Features - [`apple-swift-format`](src/apple-swift-format) and [`swiftlint`](src/swiftlint). These install [apple/swift-format](https://github.com/apple/swift-format) and [realm/SwiftLint](https://github.com/realm/SwiftLint) respectively inside of a devcontainer.

## Requirements

Depending on the Feature and/or devcontainer setup, the release binary might have to be compiled from source and/or require more tools to available (`git`, `curl`, `sed`, `swift`). For specific information on what is needed refer to the `README` of the respective Feature.

Compiling from source, as well as setting up an image with Swift in the first place, can take quite some time. I'd heavily recommend using prebuilt images for things like i.e. GitHub Codespaces if you will be creating new containers somewhat regularly, or just don't want to wait a long time on building the container once you need it.
