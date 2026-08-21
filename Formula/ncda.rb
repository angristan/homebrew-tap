class Ncda < Formula
  desc "An ncdu-like terminal monitor for live Linux file I/O"
  homepage "https://github.com/angristan/ncda"
  version "1.0.0"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-arm64.tar.gz"
      sha256 "50cc3175ad67397a811eed9dceb2f4b62b1f0e473d31bd5cf4a048feb51f1f35"
    end

    on_intel do
      url "https://github.com/angristan/ncda/releases/download/v#{version}/ncda-#{version}-linux-x86_64.tar.gz"
      sha256 "a48a76552fb2c83a9ce9b1dc20a2e4f2ed8d18eac289791e62057acf3d9e3259"
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
