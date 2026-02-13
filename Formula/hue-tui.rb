class HueTui < Formula
  desc "Terminal UI for controlling Philips Hue lights"
  homepage "https://github.com/angristan/hue-tui"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/angristan/hue-tui/releases/download/v#{version}/hue-tui_#{version}_darwin_arm64.tar.gz"
      sha256 "2bbef471ee2f84f6fd1d3dd6d60b81890b1087ff505059da9a396f9a2296b347"
    end

    on_intel do
      url "https://github.com/angristan/hue-tui/releases/download/v#{version}/hue-tui_#{version}_darwin_amd64.tar.gz"
      sha256 "49668b9d5f4d11c0f8e22a4a23763bd051744cc38f171b82184a5f3696fb3881"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/angristan/hue-tui/releases/download/v#{version}/hue-tui_#{version}_linux_arm64.tar.gz"
      sha256 "10dcbf09b652269d7154b5b5b577b4fccd90f0adbaf0982e44b5b38bfba404a7"
    end

    on_intel do
      url "https://github.com/angristan/hue-tui/releases/download/v#{version}/hue-tui_#{version}_linux_amd64.tar.gz"
      sha256 "9304acddbaefcb66e45141870b20c531bbe6c3b9a674084cf2cfdebeb4251e3e"
    end
  end

  def install
    bin.install "hue"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hue --version")
  end
end
