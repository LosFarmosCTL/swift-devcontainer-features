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

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    echo "Architecture is x86_64, downloading SwiftLint binary release $VERSION..."

    ARTIFACT_URL="https://github.com/realm/swiftlint/releases/download/$VERSION/swiftlint_linux_amd64.zip"
elif [ "$ARCH" = "aarch64" ]; then
    echo "Architecture is aarch64, downloading SwiftLint binary release $VERSION..."

    ARTIFACT_URL="https://github.com/realm/swiftlint/releases/download/$VERSION/swiftlint_linux_arm64.zip"
else
    echo "Architecture $ARCH is not supported, please use x86_64 or aarch64."
    exit 1
fi

mkdir swiftlint
cd swiftlint

curl -o swiftlint.zip -L $ARTIFACT_URL
unzip swiftlint.zip
mv ./swiftlint /usr/local/bin/swiftlint

echo "SwiftLint installed, cleaning up..."
cd ..
rm -rf swiftlint

echo "Done!"
