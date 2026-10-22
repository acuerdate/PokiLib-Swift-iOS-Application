//
//  PokemonDetail.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation

struct PokemonDetail: Decodable, Identifiable{
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeSlot]
    
    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
    }
    
    var primaryType: String{
        types.first?.type.name ?? "unknown"
    }
}
