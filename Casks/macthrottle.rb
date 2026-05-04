cask "macthrottle" do
  version "1.8.1"
  sha256 "04e1f7ce9476be1d8b8f0056d683814f357006f381c38d1e4c77347031685460"

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
