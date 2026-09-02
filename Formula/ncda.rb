class Ncda < Formula
  desc "Terminal monitor for live Linux file I/O with ncdu-like navigation"
  homepage "https://github.com/angristan/ncda"
  version "1.1.0"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-arm64.tar.gz"
      sha256 "a3addadbd4c44ef838770cad04a652a86aeb10003380c1ebd8d1b064ea9f5bae"
    end

    on_intel do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-x86_64.tar.gz"
      sha256 "e54095d20a6fbed041046c94f9502a9c241391bdf53f3e57016f06ddc26fadb1"
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
