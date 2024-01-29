//
//  MatchModel.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/22.
//

import Foundation
struct MatchDto: Codable {
    let metadata: MetadataDto
    let info: InfoDto
}

struct MetadataDto: Codable {
    let dataVersion: String
    let matchId: String
    let participants: [String]
}
struct InfoDto: Codable {
    let gameCreation: UInt64
    let gameDuration: UInt64
    let gameEndTimestamp: UInt64
    let gameId: UInt64
    let gameMode: String
    let gameName: String
    let gameStartTimestamp: UInt64
    let gameType: String
    let gameVersion: String
    let mapId: Int
    let participants: [ParticipantDto]
    let platformId: String
    let queueId: Int
    let teams: [TeamDto]
    let tournamentCode: String
}
struct ParticipantDto: Codable {
    
    let assists: Int
    let baronKills: Int
    let bountyLevel: Int
    let champExperience: Int
    let champLevel: Int
    let championId: Int
    let championName: String
    let championTransform: Int
    let consumablesPurchased: Int
    let damageDealtToBuildings: Int
    let damageDealtToObjectives: Int
    let damageDealtToTurrets: Int
    let damageSelfMitigated: Int
    let deaths: Int
    let detectorWardsPlaced: Int
    let doubleKills: Int
    let dragonKills: Int
    let firstBloodAssist: Bool
    let firstBloodKill: Bool
    let firstTowerAssist: Bool
    let firstTowerKill: Bool
    let gameEndedInEarlySurrender: Bool
    let gameEndedInSurrender: Bool
    let goldEarned: Int
    let goldSpent: Int
    let individualPosition: String
    let inhibitorKills: Int
    let inhibitorTakedowns: Int
    let inhibitorsLost: Int
    let item0: Int
    let item1: Int
    let item2: Int
    let item3: Int
    let item4: Int
    let item5: Int
    let item6: Int
    let itemsPurchased: Int
    let killingSprees: Int
    let kills: Int
    let lane: String
    let largestCriticalStrike: Int
    let largestKillingSpree: Int
    let largestMultiKill: Int
    let longestTimeSpentLiving: Int
    let magicDamageDealt: Int
    let magicDamageDealtToChampions: Int
    let magicDamageTaken: Int
    let neutralMinionsKilled: Int
    let nexusKills: Int
    let nexusTakedowns: Int
    let nexusLost: Int
    let objectivesStolen: Int
    let objectivesStolenAssists: Int
    let participantId: Int
    let pentaKills: Int
    let perks: PerksDto
    let physicalDamageDealt: Int
    let physicalDamageDealtToChampions: Int
    let physicalDamageTaken: Int
    let profileIcon: Int
    let puuid: String
    let quadraKills: Int
    let riotIdGameName: String
    let riotIdTagline: String
    let role: String
    let sightWardsBoughtInGame: Int
    let spell1Casts: Int
    let spell2Casts: Int
    let spell3Casts: Int
    let spell4Casts: Int
    let summoner1Casts: Int
    let summoner1Id: Int
    let summoner2Casts: Int
    let summoner2Id: Int
    let summonerId: String
    let summonerLevel: Int
    let summonerName: String
    let teamEarlySurrendered: Bool
    let teamId: Int
    let teamPosition: String
    let timeCCingOthers: Int
    let timePlayed: Int
    let totalDamageDealt: Int
    let totalDamageDealtToChampions: Int
    let totalDamageShieldedOnTeammates: Int
    let totalDamageTaken: Int
    let totalHeal: Int
    let totalHealsOnTeammates: Int
    let totalMinionsKilled: Int
    let totalTimeCCDealt: Int
    let totalTimeSpentDead: Int
    let totalUnitsHealed:  Int
    let tripleKills: Int
    let trueDamageDealt: Int
    let trueDamageDealtToChampions: Int
    let trueDamageTaken: Int
    let turretKills: Int
    let turretTakedowns: Int
    let turretsLost: Int
    let unrealKills: Int
    let visionScore: Int
    let visionWardsBoughtInGame: Int
    let wardsKilled: Int
    let wardsPlaced: Int
    let win: Bool
}

struct PerksDto: Codable {
    let statPerks: PerkStatsDto
    let styles: [PerkStyleDto]
}

struct PerkStatsDto: Codable {
    let defense: Int
    let flex: Int
    let offense: Int
    
}


struct PerkStyleDto: Codable {
    let description: String
    let selections: [PerkStyleSelectionDto]
    let style: Int
}

struct PerkStyleSelectionDto: Codable {
    let perk: Int
    let var1: Int
    let var2: Int
    let var3: Int
}

struct TeamDto: Codable {
    let bans: [BanDto]
    let objectives: ObjectivesDto
    let teamId: Int
    let win: Bool
    
}

struct BanDto: Codable {
    let championId: Int
    let pickTurn: Int
}

struct ObjectivesDto: Codable {
    let baron: ObjectiveDto
    let champion: ObjectiveDto
    let dragon: ObjectiveDto
    let inhibitor: ObjectiveDto
    let riftHerald: ObjectiveDto
    let tower: ObjectiveDto
}

struct ObjectiveDto: Codable {
    let first: Bool
    let kills: Int
}
