//
//  MatchDetailsCellView.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/24.
//

import SwiftUI

struct MatchDetailsCellView: View {
    private let participant: ParticipantDto
    private var champion: Champion?
    init(participant: ParticipantDto) {
        self.participant = participant
        self.champion = ChampionModel.shared.getChampionFromId(id: String(participant.championId))
    }
    var body: some View {
   
            
            HStack {

                if let champion = self.champion {
                    ChampionSquareView(champion: champion)
                        .frame(width: 60)
                }
                
                VStack {
                    HStack() {
                        Text(participant.summonerName)
                            .bold()
                            .font(.callout)
                        Spacer()
                        Text("\(participant.kills)/\(participant.deaths)/\(participant.assists)")
                            .bold()
                            .font(.callout)
                            .frame(width: 70)
                        Text("\(participant.totalMinionsKilled)")
                            .bold()
                            .font(.callout)
                            .frame(width: 30)
                        Text("\(participant.goldEarned / 1000)K")
                            .bold()
                            .font(.callout)
                            .frame(width: 30)
                    }
                    
                    HStack {
                        if let summoner1 = SummonerModel.shared.getSummonerFromKey(key: String(participant.summoner1Id)), let summoner2 = SummonerModel.shared.getSummonerFromKey(key: String(participant.summoner2Id)) {
                            AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/14.2.1/img/spell/\(summoner1.id).png"), content: { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(.circle)
                                        .frame(width: 25)
                                })
                                {
                                    EmptyView()
                                }
                            AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/14.2.1/img/spell/\(summoner2.id).png"), content: { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(.circle)
                                        .frame(width: 25)
                                })
                                {
                                    EmptyView()
                                }
                        }
                        
                        Spacer()
                        ItemView(itemId: participant.item0)
                            .frame(width: 25)
                        ItemView(itemId: participant.item1)
                            .frame(width: 25)
                        ItemView(itemId: participant.item2)
                            .frame(width: 25)
                        ItemView(itemId: participant.item3)
                            .frame(width: 25)
                        ItemView(itemId: participant.item4)
                            .frame(width: 25)
                        ItemView(itemId: participant.item5)
                            .frame(width: 25)
                    }
                }
                
            }
        
  
       
        
    }
}

#Preview {
    MatchDetailsCellView(participant: ParticipantDto(assists: 33, baronKills: 0, bountyLevel: 1, champExperience: 22854, champLevel: 18, championId: 63, championName: "Brand", championTransform: 0, consumablesPurchased: 2, damageDealtToBuildings: 1519, damageDealtToObjectives: 1519, damageDealtToTurrets: 1519, damageSelfMitigated: 12894, deaths: 11, detectorWardsPlaced: 0, doubleKills: 3, dragonKills: 0, firstBloodAssist: false, firstBloodKill: false, firstTowerAssist: true, firstTowerKill: false, gameEndedInEarlySurrender: false, gameEndedInSurrender: false, goldEarned: 16111, goldSpent: 13500, individualPosition: "Invalid", inhibitorKills: 0, inhibitorTakedowns: 2, inhibitorsLost: 2, item0: 6653, item1: 3158, item2: 3116, item3: 3089, item4: 3165, item5: 4630, item6: 2052, itemsPurchased: 17, killingSprees: 3, kills: 18, lane: "MIDDLE", largestCriticalStrike: 0, largestKillingSpree: 6, largestMultiKill: 2, longestTimeSpentLiving: 204, magicDamageDealt: 77381, magicDamageDealtToChampions: 36866, magicDamageTaken: 26407, neutralMinionsKilled: 0, nexusKills: 0, nexusTakedowns: 0, nexusLost: 0, objectivesStolen: 0, objectivesStolenAssists: 0, participantId: 9, pentaKills: 0, perks: MyLeague.PerksDto(statPerks: MyLeague.PerkStatsDto(defense: 5001, flex: 5008, offense: 5008), styles: [MyLeague.PerkStyleDto(description: "primaryStyle", selections: [MyLeague.PerkStyleSelectionDto(perk: 8128, var1: 2290, var2: 41, var3: 0), MyLeague.PerkStyleSelectionDto(perk: 8126, var1: 2204, var2: 0, var3: 0), MyLeague.PerkStyleSelectionDto(perk: 8138, var1: 30, var2: 0, var3: 0), MyLeague.PerkStyleSelectionDto(perk: 8106, var1: 5, var2: 0, var3: 0)], style: 8100), MyLeague.PerkStyleDto(description: "subStyle", selections: [MyLeague.PerkStyleSelectionDto(perk: 8014, var1: 1723, var2: 0, var3: 0), MyLeague.PerkStyleSelectionDto(perk: 8009, var1: 5035, var2: 0, var3: 0)], style: 8000)]), physicalDamageDealt: 3835, physicalDamageDealtToChampions: 1472, physicalDamageTaken: 5857, profileIcon: 4780, puuid: "ufLHHGThkFK-xlzwVZpB_N-fvhX_Od03iR79BH-cYal6TqQozshOKXGJ2o15dcFTsfmSO_PD2MAHCg", quadraKills: 0, riotIdGameName: "RunningCoconut", riotIdTagline: "NA1", role: "SUPPORT", sightWardsBoughtInGame: 0, spell1Casts: 60, spell2Casts: 75, spell3Casts: 55, spell4Casts: 15, summoner1Casts: 6, summoner1Id: 4, summoner2Casts: 22, summoner2Id: 32, summonerId: "IL81waRvZLx1Ex7MuG5c7mJD492kWKn5nmsZk1rnltwHunep", summonerLevel: 132, summonerName: "RunningCoconut", teamEarlySurrendered: false, teamId: 200, teamPosition: "", timeCCingOthers: 58, timePlayed: 1310, totalDamageDealt: 87332, totalDamageDealtToChampions: 41275, totalDamageShieldedOnTeammates: 0, totalDamageTaken: 33037, totalHeal: 2629, totalHealsOnTeammates: 0, totalMinionsKilled: 39, totalTimeCCDealt: 418, totalTimeSpentDead: 310, totalUnitsHealed: 1, tripleKills: 0, trueDamageDealt: 6116, trueDamageDealtToChampions: 2936, trueDamageTaken: 772, turretKills: 1, turretTakedowns: 4, turretsLost: 2, unrealKills: 0, visionScore: 0, visionWardsBoughtInGame: 0, wardsKilled: 0, wardsPlaced: 0, win: true))
}
