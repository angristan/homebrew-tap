#!/usr/bin/env bash
set -euo pipefail

VERSION="$1"
REPO="angristan/hue-tui"
FORMULA="Formula/hue-tui.rb"

echo "Updating hue-tui to ${VERSION}"

# Download checksums from GoReleaser
CHECKSUMS=$(curl -sL "https://github.com/${REPO}/releases/download/v${VERSION}/checksums.txt")

get_sha() {
	echo "$CHECKSUMS" | grep "$1" | cut -d' ' -f1
}

DARWIN_ARM64_SHA=$(get_sha "darwin_arm64.tar.gz")
DARWIN_AMD64_SHA=$(get_sha "darwin_amd64.tar.gz")
LINUX_ARM64_SHA=$(get_sha "linux_arm64.tar.gz")
LINUX_AMD64_SHA=$(get_sha "linux_amd64.tar.gz")

echo "darwin arm64: ${DARWIN_ARM64_SHA}"
echo "darwin amd64: ${DARWIN_AMD64_SHA}"
echo "linux arm64:  ${LINUX_ARM64_SHA}"
echo "linux amd64:  ${LINUX_AMD64_SHA}"

cat >"${FORMULA}" <<EOF
class HueTui < Formula
  desc "Terminal UI for controlling Philips Hue lights"
  homepage "https://github.com/${REPO}"
  version "${VERSION}"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/${REPO}/releases/download/v#{version}/hue-tui_#{version}_darwin_arm64.tar.gz"
      sha256 "${DARWIN_ARM64_SHA}"
    end

    on_intel do
      url "https://github.com/${REPO}/releases/download/v#{version}/hue-tui_#{version}_darwin_amd64.tar.gz"
      sha256 "${DARWIN_AMD64_SHA}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/${REPO}/releases/download/v#{version}/hue-tui_#{version}_linux_arm64.tar.gz"
      sha256 "${LINUX_ARM64_SHA}"
    end

    on_intel do
      url "https://github.com/${REPO}/releases/download/v#{version}/hue-tui_#{version}_linux_amd64.tar.gz"
      sha256 "${LINUX_AMD64_SHA}"
    end
  end

  def install
    bin.install "hue"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hue --version")
  end
end
EOF

echo "Updated ${FORMULA}"
