class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "2.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "62185e3c2e76ad8f2c3ea7b3421eff93ce85e1f81d17824450cef9253bb597e7"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-x86_64.tar.gz"
      sha256 "f6516aa7f8f623f6faf447b85e2c5ab4677fa79341534f33c69b9e924705bf37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-arm64.tar.gz"
      sha256 "5b7b03bf3067cc4026f88c69122697f3d4f7d513629af5a0d8770e791e3a412b"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "a1f90b2831f8d7a25bb9ad76cf33c90ca133d7f1b77412d0720fc256a94a153b"
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
