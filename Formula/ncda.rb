class Ncda < Formula
  desc "Terminal monitor for live Linux file I/O with ncdu-like navigation"
  homepage "https://github.com/angristan/ncda"
  version "1.0.3"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-arm64.tar.gz"
      sha256 "e78ffa76b102c5f40f99b2a1b128b93f045def19e44c7faa1d94f3421005341d"
    end

    on_intel do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-x86_64.tar.gz"
      sha256 "20f71fd4a33def7c14fe31a4a051de767c85168034f6ae8464935bb551b6c5b1"
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
