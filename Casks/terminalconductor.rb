cask "terminalconductor" do
  version "1.1.2"
  sha256 "84994abb9d15de7746e151b27522849c0e4ab88875bf8c96065b8b0e78b21e18"

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
