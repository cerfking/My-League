//
//  SplashView.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/28.
//

import SwiftUI

struct ChampionSplashView: View {
    private var championId: String = ""
    init(championId: String) {
        self.championId = championId
    }
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(championId)_0.jpg"), content: { image in
                image.resizable()
                     .scaledToFit()
            },
            placeholder: {
                ProgressView()
            })

          
        }
    }
}

#Preview {
    ChampionSplashView(championId: "Ahri")
}
