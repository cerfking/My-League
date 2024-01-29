//
//  SpellView.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/28.
//

import SwiftUI

struct SpellView: View {
    private let spell: ChampionSpell
    init(spell: ChampionSpell) {
        self.spell = spell
    }
    var body: some View {
        let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/14.2.1/img/spell/\(spell.image.full)")
        AsyncImage(url: url, content: {image in
            image
        }) {
            EmptyView()
        }
      
    }
}

#Preview {
    SpellView(spell: ChampionSpell(id: "AhriR", name: "Spirit Rush", description: "Ahri dashes forward and fires essence bolts, damaging nearby enemies. Spirit Rush can be cast up to three times before going on cooldown, and gains additional recasts when taking down enemy champions.", cooldownBurn: "130/105/80", costBurn: "100", image: ChampionImage(full: "AhriR.png", sprite: "spell0.png", group: "spell", x: 240, y: 96, w: 48, h: 48)))
}
