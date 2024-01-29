//
//  ChampionModel.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/20.
//

import Foundation
struct ChampionData: Codable {
    let data: [String: Champion]
}

struct Champion: Codable {
    let id: String
    let key: String
    let name: String
    let title: String
    let image: ChampionImage
    let skins: [ChampionSkin]
    let lore: String
    let blurb: String
    let allytips: [String]
    let enemytips: [String]
    let tags: [String]
    let partype: String
    let info: ChampionInfo
    //let stats: ChampionStats
    let spells: [ChampionSpell]
    let passive: ChampionPassive
}
struct ChampionSkin: Codable {
    let id: String
    let num: Int
    let name: String
    let chromas: Bool
}
struct ChampionInfo: Codable {
    let attack: Int
    let defense: Int
    let magic:  Int
    let difficulty: Int
}
struct ChampionSpell: Codable {
    let id: String
    let name: String
    let description: String
    let cooldownBurn: String
    let costBurn: String
    let image: ChampionImage
}
struct ChampionPassive: Codable {
    let name: String
    let description: String
    let image: ChampionImage
}


struct ChampionImage: Codable {
    let full: String
    let sprite: String
    let group: String
    let x: Int
    let y: Int
    let w: Int
    let h: Int
}

class ChampionModel {
    init() {
        
    }
    static let shared = ChampionModel()
    func getChampionFromId(id: String) -> Champion? {
        if let fileURL = Bundle.main.url(forResource: "championFull", withExtension: "json") {
            do {
                // Read JSON data from the file
                let jsonData = try Data(contentsOf: fileURL)
                
                // Decode JSON data
                let championData = try JSONDecoder().decode(ChampionData.self, from: jsonData)
                
                // Find the champion with key 166
                if let champion = championData.data.values.first(where: { $0.key == id }) {
             
                    return champion
                } else {
                    print("Champion not found.")
                }
            } catch {
                print("Error reading or decoding JSON: \(error)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }
   
}

