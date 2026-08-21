#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 VERSION" >&2
  exit 2
fi

version=$1
repo="angristan/ncda"
formula="Formula/ncda.rb"

sha_for() {
  local platform=$1
  curl -fsSL "https://github.com/${repo}/releases/download/v${version}/ncda-${version}-${platform}.tar.gz" \
    | sha256sum | cut -d' ' -f1
}

linux_x86_64_sha=$(sha_for linux-x86_64)
linux_arm64_sha=$(sha_for linux-arm64)

cat >"$formula" <<EOF
class Ncda < Formula
  desc "An ncdu-like terminal monitor for live Linux file I/O"
  homepage "https://github.com/${repo}"
  version "${version}"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/${repo}/releases/download/v#{version}/ncda-#{version}-linux-arm64.tar.gz"
      sha256 "${linux_arm64_sha}"
    end

    on_intel do
      url "https://github.com/${repo}/releases/download/v#{version}/ncda-#{version}-linux-x86_64.tar.gz"
      sha256 "${linux_x86_64_sha}"
    end
  end

  def install
    bin.install "ncda"
    bin.install "ncda-bench"
  end

  def caveats
    "ncda requires Linux 6.1+ and root or equivalent eBPF capabilities."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ncda --version")
    assert_match version.to_s, shell_output("#{bin}/ncda-bench --version")
  end
end
EOF

printf 'Updated %s to %s\n' "$formula" "$version"
