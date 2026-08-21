class FastResume < Formula
  desc "Fuzzy finder for coding agent session history"
  homepage "https://github.com/angristan/fast-resume"
  version "2.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-arm64.tar.gz"
      sha256 "6bd083f9e25f19e0c07e7e560358cbab77eee493992a58b5d6cabf6b7d1aa3c8"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-macos-x86_64.tar.gz"
      sha256 "66a0dd07eef940c9be877c436afa06883b12ee92b5ce5919942168b493f9ce18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-arm64.tar.gz"
      sha256 "899073e93ede7386e279351ea7867e9d9764fd5b84ac0e8a7afc929515b1f520"
    end

    on_intel do
      url "https://github.com/angristan/fast-resume/releases/download/v#{version}/fast-resume-#{version}-linux-x86_64.tar.gz"
      sha256 "d44762d93eb0e1d03166fed2bfe106cf8da2e1dcceddb31fd3d8b0872f2dec7d"
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
