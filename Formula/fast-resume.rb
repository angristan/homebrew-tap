class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "2.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "ae5f8074aaa180d7f5e3a39cbc42d570bc1e4dcafc48ed1be682ca1f2431d85f"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-x86_64.tar.gz"
      sha256 "b0b5dec1cde9ecabcab12859986ac4567cd8397c50d22434580d69b7bcaefdce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-arm64.tar.gz"
      sha256 "822bc5287877532d2e84a429974ad83499d26dc208e73cbbcab678dfc1d18761"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "2d078d1712b73bd3102d1cf1b3c6dcc1672b5e59c1583247cbaffa11e9972fc4"
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
