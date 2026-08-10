cask "macthrottle" do
  version "1.9.1"
  sha256 "326671968aea7f0559ea867f06318d2fab1a9536831f7fbdc8537a77898df781"

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
