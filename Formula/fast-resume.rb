class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "1.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "711aada0c62aa8122aac85ec5a9d566e148fb801f4e369f1e4a2332f61163d68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "8925b49d5059849cd4e0b1968841de96f53c4cd3bd79871812ceee29b9281c23"
    end
  end

  def install
    if (buildpath/"fr/fr").exist?
      bin.install "fr/fr"
      bin.install_symlink bin/"fr" => "fast-resume"
    else
      libexec.install "_internal"
      libexec.install "fr"
      bin.install_symlink libexec/"fr"
      bin.install_symlink libexec/"fr" => "fast-resume"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fr --version")
    assert_match version.to_s, shell_output("#{bin}/fast-resume --version")
  end
end
