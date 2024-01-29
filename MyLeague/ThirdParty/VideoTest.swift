//
//  VideoTest.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/28.
//

import SwiftUI

struct VideoTest: View {
    @State var mediaURL: URL?
    var body: some View {
        VideoViewRepresented(mediaUrl: $mediaURL)
        Button("TEST") {
//            let result = Int(content)! + 1
//            content = String(result)
            mediaURL = URL(string: "https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0103/ability_0103_E1.webm")!
        }
    }
}

#Preview {
    VideoTest(mediaURL: URL(string: "https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0103/ability_0103_R1.webm")!)
}
