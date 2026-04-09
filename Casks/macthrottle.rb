cask "macthrottle" do
  version "1.7.3"
  sha256 "8bf76d8c94af5e70d12929cd81abf7396096cd5d288e74a724c0d7e727053cc6"

  url "https://github.com/angristan/MacThrottle/releases/download/v#{version}/MacThrottle-#{version}.dmg"
  name "MacThrottle"
  desc "Menu bar app that monitors thermal throttling"
  homepage "https://github.com/angristan/MacThrottle"

  depends_on macos: ">= :sequoia"

  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/MacThrottle.app"]
  end

  app "MacThrottle.app"

  zap trash: [
    "~/Library/Preferences/com.macthrottle.app.plist",
  ]
end
