class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "1.16.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "5a85616c00f262caf7e380a35dbde892d5a37b6f51fc1da992f87d7195511ef7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "ccc31e35d74d28b9d51a8bbc324540adc32eb551a7929b65aa7564db3f901881"
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
