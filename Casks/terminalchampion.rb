cask "terminalchampion" do                                                                                                                  
    version "1.1.1"                                                                                                                           
    sha256 "dd277b3ed9bb1c094d17db64b7fdd93e35c62afa2572317ab11b22eeea39543d"                                                                   
                                                                                                                                                
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
