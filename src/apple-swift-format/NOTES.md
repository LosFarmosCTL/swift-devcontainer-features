Since there are no suitable binary releases available, `swift-format` is always compiled from source. Therefore the devcontainer needs to fulfill the following requirements:

1. Some version of `git` being available, or alternatively the apt package manager (i.e. any Debian/Ubuntu devcontainer image would work)
2. Some version of `swift` being available, the version of Swift that is installed in the container determines what exact version of swift-format should be used. For details on which versions match refer to the [swift-format README](https://github.com/apple/swift-format#matching-swift-format-to-your-swift-version-swift-57-and-earlier)

A good container template that fulfills both requirements would be the [`swift-devcontainer-template`](https://github.com/swift-server/swift-devcontainer-template) maintained by the official Swift Server workgroup.
