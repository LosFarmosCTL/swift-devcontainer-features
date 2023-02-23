SwiftLint only provides binary releases for x86_64, so for all other containers, it will be compiled from source. For the build to work, the container needs to fulfill the following requirements:

1. Some version of `git` being available, or alternatively the apt package manager (i.e. any Debian/Ubuntu devcontainer image would work)
2. Some version of `swift` being available, the exact version depends on the version of SwiftLint being used, but newer Swift versions should always be able to compile older SwiftLint releases. SwiftLint itself hooks into SourceKit, so older versions should still work even with new Swift releases, although it's of course always recommended to use the latest version possible. For concrete information on what Swift version a specific SwiftLint release requires to build, look at their [GitHub releases](https://github.com/realm/SwiftLint/releases).

A good container template that fulfills both requirements would be the [`swift-devcontainer-template`](https://github.com/swift-server/swift-devcontainer-template) maintained by the official Swift Server workgroup.
