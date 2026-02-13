#!/usr/bin/env bash
set -euo pipefail

VERSION="$1"
REPO="angristan/MacThrottle"
CASK="Casks/macthrottle.rb"

echo "Updating macthrottle to ${VERSION}"

DMG_SHA=$(curl -sL "https://github.com/${REPO}/releases/download/v${VERSION}/MacThrottle-${VERSION}.dmg" | sha256sum | cut -d' ' -f1)

echo "DMG SHA: ${DMG_SHA}"

cat >"${CASK}" <<EOF
cask "macthrottle" do
  version "${VERSION}"
  sha256 "${DMG_SHA}"

  url "https://github.com/${REPO}/releases/download/v#{version}/MacThrottle-#{version}.dmg"
  name "MacThrottle"
  desc "Menu bar app that monitors thermal throttling"
  homepage "https://github.com/${REPO}"

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
EOF

echo "Updated ${CASK}"
