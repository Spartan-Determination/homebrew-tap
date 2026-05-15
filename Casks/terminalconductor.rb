cask "terminalconductor" do
  version "1.1.1"
  sha256 "e431136f7cb768a58ddb694a0fd08e65440381cca2124b64557fb3c2b31c8f3b"

  url "https://updates.terminalconductor.com/v#{version}/TerminalConductor-#{version}-universal.dmg"
  name "TerminalConductor"
  desc "Visual orchestration layer for terminal sessions and AI coding agents"
  homepage "https://terminalconductor.com"

  livecheck do
    url "https://updates.terminalconductor.com/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  app "TerminalConductor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine",
                          "#{appdir}/TerminalConductor.app"],
                   sudo: false
  end

  uninstall quit: "com.terminalconductor.app"

  zap trash: [
    "~/Library/Preferences/com.terminalconductor.app.plist",
    "~/Library/Application Support/com.terminalconductor.app",
    "~/Library/Caches/com.terminalconductor.app",
    "~/Library/Logs/TerminalConductor",
  ]
end
