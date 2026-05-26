class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "1.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "96d920a9b413b1f0026be87319134f687e0dc9ab5b707c71c1d99dec901c3b52"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "a0166534eb698cdda1f2f4600cd4183ae03f0830eb9bed10899edd286d44b548"
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
