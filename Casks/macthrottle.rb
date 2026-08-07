cask "macthrottle" do
  version "1.8.3"
  sha256 "547a98d59efbc4784b487464558c2ef9016d7253780469d62ff32d2eaa399b60"

  url "https://github.com/angristan/MacThrottle/releases/download/v#{version}/MacThrottle-#{version}.dmg"
  name "MacThrottle"
  desc "Menu bar app that monitors thermal throttling"
  homepage "https://github.com/angristan/MacThrottle"

  depends_on macos: :sequoia

  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/MacThrottle.app"]
  end

  app "MacThrottle.app"

  zap trash: [
    "~/Library/Preferences/com.macthrottle.app.plist",
  ]
end
