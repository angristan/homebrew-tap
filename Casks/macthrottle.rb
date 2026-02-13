cask "macthrottle" do
  version "1.7.2"
  sha256 "e7fbdccdd22d800948f7688f52766dbc164724a5ec38c1f1245f1bd99dafc9b4"

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
