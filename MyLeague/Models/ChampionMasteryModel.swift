//
//  ChampionMasteryModel.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/21.
//

import Foundation
struct ChampionMasteryDto: Codable {
    let puuid: String
    let championPointsUntilNextLevel: UInt64
    let chestGranted: Bool
    let championId: UInt64
    let lastPlayTime: UInt64
    let championLevel: Int
    let summonerId: String
    let championPoints: Int
    let championPointsSinceLastLevel: UInt64
    let tokensEarned: Int
}
