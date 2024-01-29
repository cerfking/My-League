//
//  Player.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/27.
//

import SwiftUI





struct Player: View {
   
    private let championKey: String
    private let spellTag: String
   
    @State private var key: String = ""
    @State private var videoURL: URL?
    
    init(championKey: String, spellTag: String) {
        self.championKey = championKey
        self.spellTag = spellTag
        
            
    }
    
    private func calculateKey(championKey: String) -> String {
        var key: String = ""
        let intValule = Int(championKey) ?? 0
       
        if intValule < 10 {
            key = "000\(championKey)"
            
        } else if intValule < 100 {
            key = "00\(championKey)"
           
        } else if intValule < 1000 {
            key = "0\(championKey)"
           
        }
        return key
    }

   
    var body: some View {
        VStack {
          
//            VLCVideoPlayer(configuration: configuration)
//            .frame(height: 280)
           //VideoTest(mediaURL: <#T##URL?#>)
            
            
        }
     
        
       
       
           
    }
        
       
}
    

#Preview {
    Player(championKey: "412", spellTag: "Q")
}
