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
