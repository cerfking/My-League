//
//  PassiveView.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/28.
//

import SwiftUI

struct PassiveView: View {
    private let passive: ChampionPassive
    init(passive: ChampionPassive) {
        self.passive = passive
    }
    
    var body: some View {
        let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/14.2.1/img/passive/\(passive.image.full)")
        AsyncImage(url: url, content: {image in image}) {
            EmptyView()
        }
    }
}

#Preview {
    PassiveView(passive: ChampionPassive(name: "Essence Theft", description: "After killing 9 minions or monsters, Ahri heals.<br>After taking down an enemy champion, Ahri heals for a greater amount.", image: ChampionImage(full: "Ahri_SoulEater2.png", sprite: "passive0.png", group: "passive", x: 48, y: 0, w: 48, h: 48)))
}
