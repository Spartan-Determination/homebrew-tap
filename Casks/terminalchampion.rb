cask "terminalchampion" do
  version "1.0.0"
  sha256 "c2d20bbc9886d5b57e00d4e68ca92d17ba54cc30d946e7e40d898c0e1cc0ff50"

  url "https://updates.terminalchampion.com/v#{version}/TerminalChampion-#{version}-universal.dmg"
  name "TerminalChampion"
  desc "Visual orchestration layer for terminal sessions and AI coding agents"
  homepage "https://terminalchampion.com"

  livecheck do
    url "https://updates.terminalchampion.com/latest-darwin.json"
    strategy :json do |json|
      json["version"]
    end
  end

  app "TerminalChampion.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine",
                          "#{appdir}/TerminalChampion.app"],
                   sudo: false
  end

  uninstall quit: "com.terminalchampion.app"

  zap trash: [
    "~/Library/Preferences/com.terminalchampion.app.plist",
    "~/Library/Application Support/com.terminalchampion.app",
    "~/Library/Caches/com.terminalchampion.app",
    "~/Library/Logs/TerminalChampion",
  ]
end
