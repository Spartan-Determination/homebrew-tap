cask "terminalchampion" do                                                                                                                  
    version "1.3.0"                                                                                                                           
    sha256 "6b17f081772b89a4ee20c6d37dbdcf13cb1e892f65173dbc20db67b3939727be"                                                                   
                                                                                                                                                
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
