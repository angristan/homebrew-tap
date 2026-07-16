class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "5f42f0fdc1e14f0e5c39032305ae605586483ecb657f1d47b1ce668db6d6a341"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-x86_64.tar.gz"
      sha256 "0220614848713dfe5b7ac24a764c6119a55271792fd17f6243f08edb0c9466c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-arm64.tar.gz"
      sha256 "2a38942c6c292902e49e6592bc4293158e1f83de4ad963c4ff4e31bb7da61c6d"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "dabb9e29825d51b2bac16492e62d5c5d21478b75e7fdd625dbc341b8d8c82d8f"
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
