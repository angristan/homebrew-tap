class Ncda < Formula
  desc "Terminal monitor for live Linux file I/O with ncdu-like navigation"
  homepage "https://github.com/angristan/ncda"
  version "1.0.1"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-arm64.tar.gz"
      sha256 "26dc0525c2541a0e0a2b49892b9229a6ef7e283c844ee1befdfdd36d0b1a5429"
    end

    on_intel do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-x86_64.tar.gz"
      sha256 "8316154f8371e48cc248bdc3d7a91de572fb91bc0049a9f0b516aa6f2025b860"
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
