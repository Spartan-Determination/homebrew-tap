cask "terminalconductor" do
  version "1.1.1"
  sha256 "2c93c6512cd3b2afaf798c03c626ae4299a04299eb5d7db19c61172937ad2aa9"

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
