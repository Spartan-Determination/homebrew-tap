cask "terminalconductor" do
  version "1.1.1"
  sha256 "7da01f119d0c43cc1e6741a63e1c1090ce93f7ac5231b4b63abdaea27b3089a0"

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
