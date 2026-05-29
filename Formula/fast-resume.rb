class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "1.17.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "487afb37733690c145f7ccee37ea265a1ad6bbbe8bc4dda728d8a83b09f55746"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "a8963ad4cce94481ce8c258986ca7f8bf3cb825c0fab2fe6c89721be4401ddfd"
    end
  end

  def install
    libexec.install "_internal"
    libexec.install "fr"
    bin.install_symlink libexec/"fr"
    bin.install_symlink libexec/"fr" => "fast-resume"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fr --version")
  end
end
