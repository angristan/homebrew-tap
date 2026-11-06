class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "2.14.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "b85934af965db68a61061c98816132bd8d920e838cccef5b9ab1527b050da588"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-x86_64.tar.gz"
      sha256 "ca09c911380695d9ce0a80ab1b0ebd0af81c2d2cd05c6f16f7d711c9c227cfdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-arm64.tar.gz"
      sha256 "1296f6c4f92d661e0bf52190060a78779db74850d90b9fe53a267eeba92f09df"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "260596c4b319c97af3bd3aa2a8469a4a699b3dc98d95c81b035974eeec4df4f5"
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
