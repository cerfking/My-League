//
//  ChampionViewViewModel.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/28.
//

import Foundation
import Observation
@Observable
class ChampionViewViewModel {
    private let champion: Champion
    var spell: ChampionSpell?
    var spells: [ChampionSpell] = []
    var passive: ChampionPassive?
    var spellTag: String = "P"
    var videoURL: URL?
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
    init(champion: Champion) {
        self.champion = champion
        self.spells = champion.spells
        self.passive = champion.passive
        self.videoURL = URL(string: "https://d28xe8vt774jo5.cloudfront.net/champion-abilities/\(calculateKey(championKey: champion.key))/ability_\(calculateKey(championKey: champion.key))_P1.webm")
    }
    
    func updateVideoURL() {
        DispatchQueue.main.async { [self] in
            self.videoURL = URL(string: "https://d28xe8vt774jo5.cloudfront.net/champion-abilities/\(calculateKey(championKey: champion.key))/ability_\(calculateKey(championKey: champion.key))_\(spellTag)1.webm")
        }
    }
}
