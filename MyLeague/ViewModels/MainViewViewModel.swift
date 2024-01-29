//
//  MainViewViewModel.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/9.
//

import Foundation
import Observation
@Observable
class MainViewViewModel {
    private var puuid: String
    var summoner: SummonerDTO?
    var champions: [Champion] = []
    var matchIds: [String] = []
    var matches: [MatchDto] = []
    
    init(puuid: String) {
        self.puuid = puuid
        Task(priority:.background) {
            do {
                let summoner = try await getSummoner()
                self.summoner = summoner
                let championMasteries = try await getChampionMasteried(count: 3)
                for championMastery in championMasteries {
                    let champion = ChampionModel.shared.getChampionFromId(id: String(championMastery.championId))!
                    self.champions.append(champion)
                  
                }
                let matchIds = try await getMatches()
                self.matchIds = matchIds
                for matchId in matchIds {
                    let match = try await getMatch(matchId: matchId)
                    matches.append(match)
                }
               
            } catch {
                print(error)
               
            }
         
        }
      
        
    }
    func getSummoner() async throws -> SummonerDTO {
       
        let endpoint = "https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/\(puuid)"
        guard let url = URL(string: endpoint) else {
            throw MLError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.addValue("RGAPI-fbeb2969-3a60-42a3-a0f1-d948b8be3efc", forHTTPHeaderField: "X-Riot-Token")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MLError.invalidURL
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(SummonerDTO.self, from: data)
        } catch {
            throw MLError.invalidURL
        }
    }
    
    func getMatches() async throws -> [String] {
        let endpoint = "https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/\(puuid)/ids?start=0&count=13"
        guard let url = URL(string: endpoint) else {
            throw MLError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.addValue("RGAPI-fbeb2969-3a60-42a3-a0f1-d948b8be3efc", forHTTPHeaderField: "X-Riot-Token")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MLError.invalidURL
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([String].self, from: data)
        } catch {
            throw MLError.invalidURL
        }
    }
    func getMatch(matchId: String) async throws -> MatchDto {
        let endpoint = "https://americas.api.riotgames.com/lol/match/v5/matches/\(matchId)"
        guard let url = URL(string: endpoint) else {
            throw MLError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.addValue("RGAPI-fbeb2969-3a60-42a3-a0f1-d948b8be3efc", forHTTPHeaderField: "X-Riot-Token")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MLError.invalidURL
        }
        
        do {
            let decoder = JSONDecoder()
            let match = try decoder.decode(MatchDto.self, from: data)
            
            return match
        } catch {
            
            throw MLError.decodeError
        }
    }
   
    
    func getChampionMasteried(count: Int) async throws -> [ChampionMasteryDto] {
        let endpoint = "https://na1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-puuid/\(puuid)/top?count=\(count)"
        guard let url = URL(string: endpoint) else {
            throw MLError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.addValue("RGAPI-fbeb2969-3a60-42a3-a0f1-d948b8be3efc", forHTTPHeaderField: "X-Riot-Token")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MLError.invalidURL
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([ChampionMasteryDto].self, from: data)
        } catch {
            throw MLError.invalidURL
        }
    }

}

struct SummonerDTO: Codable {
    let accountId: String
    let profileIconId: Int
    let revisionDate: UInt64
    let name: String
    let id: String
    let puuid: String
    let summonerLevel: UInt64
}
