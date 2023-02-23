#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if [ "$VERSION" = "latest" ]; then
    LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/realm/swiftlint/releases/latest)
    LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')

    VERSION=$LATEST_VERSION
fi

ARCHITECTURE=$(dpkg --print-architecture)

# Binary releases are only available for x86_64
if [ "$ARCHITECTURE" = "x86_64" ]; then
    echo "Architecture is x86_64, downloading SwiftLint binary release $VERSION..."

    if ! type curl >/dev/null 2>&1; then
        echo "No curl executable found."
        exit 1
    fi

    ARTIFACT_URL="https://github.com/realm/swiftlint/releases/download/$VERSION/swiftlint_linux.zip"

    mkdir swiftlint
    cd swiftlint

    curl -o swiftlint.zip -L $ARTIFACT_URL
    unzip swiftlint.zip
    mv ./swiftlint /usr/local/bin/swiftlint

    echo "SwiftLint downloaded, cleaning up..."
    cd ..
    rm -rf swiftlint
else
    echo "Architecture is $ARCHITECTURE, building from source..."

    if ! type swift >/dev/null 2>&1; then
        echo "No swift executable found."
        exit 1
    elif ! type git >/dev/null 2>&1; then
        echo "No git executable found."
        exit 1
    fi

    echo "Cloning realm/SwiftLint on version $VERSION..."

    git clone https://github.com/realm/swiftlint
    cd swiftlint

    git checkout "tags/$VERSION"

    echo "Building SwiftLint..."
    swift package update
    swift build -c release -Xswiftc -static-stdlib -Xlinker -lCFURLSessionInterface -Xlinker -lCFXMLInterface -Xlinker -lcurl -Xlinker -lxml2 -Xswiftc -I. -Xlinker -fuse-ld=lld -Xlinker -L/usr/lib/swift/linux --product swiftlint
    mv .build/release/swiftlint /usr/local/bin/swiftlint

    echo "SwiftLint installed, cleaning up..."
    cd ..
    rm -rf swift-format
fi

echo "Done!"
