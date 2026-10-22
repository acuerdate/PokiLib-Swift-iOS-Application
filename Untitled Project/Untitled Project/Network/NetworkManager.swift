//
//  NetworkManager.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    private init(){
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getPokemonsList(urlString: String) async throws -> PokemonListResponse {
        
        guard let url = URL(string: urlString) else {
            throw NetworkErrors.invalidURL
        }
        
        print("URL: \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        print("Data: \(data)")
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkErrors.badResponse
        }
        
        do{
            return try decoder.decode(PokemonListResponse.self, from: data)
        } catch {
            print("Decode error: \(error)")
            throw NetworkErrors.invalidData
        }
    }
    
    
    func getPokemonDetail(urlString: String) async throws -> PokemonDetail{
        guard let url = URL(string: urlString) else {
            throw NetworkErrors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw NetworkErrors.badResponse
        }
        
        return try decoder.decode(PokemonDetail.self, from: data)
    }
    
    
    func getAllTypes(urlString: String) async throws -> TypeListResponse{
        guard let url = URL(string: urlString) else {
            throw NetworkErrors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw NetworkErrors.badResponse
        }
        
        return try decoder.decode(TypeListResponse.self, from: data)
    }
}
