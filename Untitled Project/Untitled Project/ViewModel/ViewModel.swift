//
//  ViewModel.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation
public import Combine


@MainActor
final class ViewModel: ObservableObject{
    
    //MARK: - Properties
    @Published var pokemonsList: [PokemonDetail] = []
    @Published var pokemonTypes: [NamedResource] = []
    @Published var isLoading = false
    
    func FetchPokemonCards() async {
        isLoading = true
        defer { isLoading = false }
        
        do{
            let listResponse = try await NetworkManager.shared.getPokemonsList(urlString: URLConstants.pokemonsListURL)
            
            var details: [PokemonDetail] = []
            for item in listResponse.results{
                if let detail = try? await NetworkManager.shared.getPokemonDetail(urlString: item.url){
                    details.append(detail)
                    print("Спрайт для \(detail.name): \(detail.sprites.other?.officialArtwork?.frontDefault ?? "nil")")
                }
            }
            pokemonsList = details
        } catch {
           print(error)
        }
    }
    
    func FetchPokemonTypes() async {
        do {
            let types = try await NetworkManager.shared.getAllTypes(urlString: URLConstants.pokemonTypesURL)
            pokemonTypes = types.results
        } catch {
            if let error = error as? NetworkErrors{
                print(error)
            }
        }
    }
}
