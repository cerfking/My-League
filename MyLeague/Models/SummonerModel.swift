//
//  SummonerModel.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/22.
//

import Foundation
struct SummonerData: Codable {
    let data: [String: Summoner]
}

struct Summoner: Codable {
    let id: String
    let name: String
    let description: String
    let tooltip: String
    let maxrank: Int
    let cooldown: [Float]
    let cooldownBurn: String
    let cost: [Int]
    let costBurn: String
    
    let key: String
    let summonerLevel: Int
}
class SummonerModel {
    init() {
        
    }
    static let shared = SummonerModel()
    func getSummonerFromKey(key: String) -> Summoner? {
        if let fileURL = Bundle.main.url(forResource: "summoner", withExtension: "json") {
            do {
                // Read JSON data from the file
                let jsonData = try Data(contentsOf: fileURL)
                
                // Decode JSON data
                let summonerData = try JSONDecoder().decode(SummonerData.self, from: jsonData)
                
                // Find the champion with key 166
                if let summoner = summonerData.data.values.first(where: { $0.key == key }) {
                    return summoner
                } else {
                    print("summoner not found.")
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
