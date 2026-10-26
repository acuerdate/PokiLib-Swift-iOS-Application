//
//  PokemonDetailViewModel.swift
//  Untitled Project
//
//  Created by 11 on 26.10.2026.
//

import Foundation
import Combine

@MainActor
final class PokemonDetailViewModel: ObservableObject {
    @Published var descriptionText: String = "Loading description..."
    
    func fetchDescription(for id: Int) async {
        do {
            let species = try await NetworkManager.shared.getPokemonSpecies(id: id)
            
            if let englishEntry = species.flavorTextEntries.first(where: { $0.language.name == "en" }) {
                descriptionText = englishEntry.flavorText
                    .replacingOccurrences(of: "\n", with: " ")
                    .replacingOccurrences(of: "\u{0C}", with: " ")
            } else {
                descriptionText = "No description available."
            }
        } catch {
            print("ОШИБКА ЗАГРУЗКИ ОПИСАНИЯ: \(error)") // <- ВАЖНО: посмотри в консоль!
            descriptionText = "Failed to load description."
        }
    }
}
