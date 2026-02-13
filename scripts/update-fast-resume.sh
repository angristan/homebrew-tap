#!/usr/bin/env bash
set -euo pipefail

VERSION="$1"
REPO="angristan/fast-resume"
FORMULA="Formula/fast-resume.rb"

echo "Updating fast-resume to ${VERSION}"

# Compute SHA256 for each platform
MACOS_ARM64_SHA=$(curl -sL "https://github.com/${REPO}/releases/download/v${VERSION}/fast-resume-${VERSION}-macos-arm64.tar.gz" | sha256sum | cut -d' ' -f1)
LINUX_X86_64_SHA=$(curl -sL "https://github.com/${REPO}/releases/download/v${VERSION}/fast-resume-${VERSION}-linux-x86_64.tar.gz" | sha256sum | cut -d' ' -f1)

echo "macOS arm64 SHA: ${MACOS_ARM64_SHA}"
echo "Linux x86_64 SHA: ${LINUX_X86_64_SHA}"

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
  end

  on_linux do
    on_intel do
      url "https://github.com/${REPO}/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "${LINUX_X86_64_SHA}"
    end
  end

  def install
    bin.install "fr"
    bin.install_symlink "fr" => "fast-resume"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fr --version")
  end
end
EOF

echo "Updated ${FORMULA}"
