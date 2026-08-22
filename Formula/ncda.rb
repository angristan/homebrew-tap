class Ncda < Formula
  desc "Terminal monitor for live Linux file I/O with ncdu-like navigation"
  homepage "https://github.com/angristan/ncda"
  version "1.0.4"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-arm64.tar.gz"
      sha256 "f1bb6eba84e6aa18d0f10a418a92d4c24de4fcf2328f54fbc3d50cbf36e0bac2"
    end

    on_intel do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-x86_64.tar.gz"
      sha256 "71d6006f1da77ee11d4d85c1e26caeaf46b7b25ce04f93282c1fd4c0b11f8897"
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
