#!/usr/bin/env bash
set -euo pipefail

VERSION="$1"
REPO="angristan/fast-resume"
FORMULA="Formula/fast-resume.rb"

echo "Updating fast-resume to ${VERSION}"

sha_for() {
  local platform="$1"
  curl -fsSL "https://github.com/${REPO}/releases/download/v${VERSION}/fast-resume-${VERSION}-${platform}.tar.gz" | sha256sum | cut -d' ' -f1
}

# Compute SHA256 for each platform
MACOS_ARM64_SHA=$(sha_for "macos-arm64")
MACOS_X86_64_SHA=$(sha_for "macos-x86_64")
LINUX_X86_64_SHA=$(sha_for "linux-x86_64")
LINUX_ARM64_SHA=$(sha_for "linux-arm64")

echo "macOS arm64 SHA: ${MACOS_ARM64_SHA}"
echo "macOS x86_64 SHA: ${MACOS_X86_64_SHA}"
echo "Linux x86_64 SHA: ${LINUX_X86_64_SHA}"
echo "Linux arm64 SHA: ${LINUX_ARM64_SHA}"

cat >"${FORMULA}" <<EOF
class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/${REPO}"
  version "${VERSION}"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/${REPO}/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "${MACOS_ARM64_SHA}"
    end

    on_intel do
      url "https://github.com/${REPO}/releases/download/v#{version}/fast-resume-#{version}-macos-x86_64.tar.gz"
      sha256 "${MACOS_X86_64_SHA}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/${REPO}/releases/download/v#{version}/fast-resume-#{version}-linux-arm64.tar.gz"
      sha256 "${LINUX_ARM64_SHA}"
    end

    on_intel do
      url "https://github.com/${REPO}/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "${LINUX_X86_64_SHA}"
    end
  end

  def install
    bin.install "fr"
    bin.install_symlink bin/"fr" => "fast-resume"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fr --version")
    assert_match version.to_s, shell_output("#{bin}/fast-resume --version")
  end
end
EOF

echo "Updated ${FORMULA}"
