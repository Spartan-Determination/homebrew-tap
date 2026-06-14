cask "terminalchampion" do                                                                                                                  
    version "1.2.0"                                                                                                                           
    sha256 "b99e90eb7d726ccfa1898302f52bf16ac576f685207ce6b6df8aad9f98df78b3"                                                                   
                                                                                                                                                
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
