#!/bin/bash

set -e

# Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
check "swift-format" swift-format --version

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
