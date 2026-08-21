class Ncda < Formula
  desc "Terminal monitor for live Linux file I/O with ncdu-like navigation"
  homepage "https://github.com/angristan/ncda"
  version "1.0.2"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-arm64.tar.gz"
      sha256 "8689b8dc19ee3c268caf8797cad8736c25caba3a3dcde565cd99f2db7901d967"
    end

    on_intel do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-x86_64.tar.gz"
      sha256 "f41755aeb05088f86fc77b71eb2fffe176544fc0e43abf4c387975b83cd73084"
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
