//
//  VideoViewRepresented.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/28.
//

import SwiftUI
import MobileVLCKit

struct VideoViewRepresented: UIViewRepresentable {
        //public var url: String
    @Binding var mediaUrl: URL?
    @State var mediaPlayer = VLCMediaPlayer()
   // @Binding var text: String
      
      func makeUIView(context: Context) -> UIView {
          let uiView = UIView()
                mediaPlayer.drawable = uiView
                return uiView
//          let controller = UIView()
//          mediaPlayer.drawable = controller
//          let uri = URL(string: self.url)
//          let media = VLCMedia(url: uri!)
//          mediaPlayer.media = media
//          mediaPlayer.play()
          //return VideoView()
      }

    func updateUIView(_ uiView: UIView, context: Context) {
    
        mediaPlayer.media = VLCMedia(url: mediaUrl!)
        
        mediaPlayer.play()
        mediaPlayer.audio?.isMuted = true
       
        
    
    }
    
}



#Preview {
    VideoViewRepresented(mediaUrl: .constant(URL(string: "https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0103/ability_0103_R1.webm")!))
}
