#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if [ "$VERSION" = "latest" ]; then
    LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/apple/swift-format/releases/latest)
    LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')

    VERSION=$LATEST_VERSION
fi

echo "Cloning swift-format on $VERSION..."

git clone https://github.com/apple/swift-format.git
cd swift-format

if ! [ "$VERSION" = "main" ]; then
    git checkout "tags/$VERSION"
fi

echo "Building swift-format..."
swift build -c release
mv .build/release/swift-format /usr/local/bin/swift-format

echo "Cleaning up..."
cd ..
rm -rf swift-format

echo "Done!"
