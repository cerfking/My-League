//
//  LoginViewViewModel.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/5.
//

import Foundation
import Observation
@Observable
class LoginViewViewModel {
    var gameName: String = ""
    var tagLine: String = ""
    init() {
        
    }
    
    func getAccount() async throws -> AccountDto {
       
        let endpoint = "https://americas.api.riotgames.com/riot/account/v1/accounts/by-riot-id/\(gameName)/\(tagLine)"
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
            return try decoder.decode(AccountDto.self, from: data)
        } catch {
            throw MLError.invalidURL
        }
    }
    
}

struct AccountDto: Codable {
    let puuid: String
    let gameName: String
    let tagLine: String
    
}

enum MLError: Error {
    case invalidURL
    case decodeError
}

