#!/bin/sh

set -e

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

apt_get_update() {
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
ensure_installed() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

export DEBIAN_FRONTEND=noninteractive

if [ "$VERSION" = "latest" ]; then
    LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/apple/swift-format/releases/latest)
    LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')

    VERSION=$LATEST_VERSION
fi

if ! type swift >/dev/null 2>&1; then
    echo "No swift executable found."
    exit 1
fi

ensure_installed git

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
rm -rf /var/lib/apt/lists/*

echo "Done!"
