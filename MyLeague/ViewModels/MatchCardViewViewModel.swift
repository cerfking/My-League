//
//  MatchCardViewViewModel.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/22.
//

import Foundation
import Observation
@Observable
class MatchCardViewViewModel {
   // private let puuid: String
    private let matchId: String
   
    init(matchId: String) {
       // self.puuid = puuid
        self.matchId = matchId
        
    }
    func getMatch() async throws -> MatchDto {
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
}
