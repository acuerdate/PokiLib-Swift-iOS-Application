//
//  PokemonList.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation

struct PokemonListItem: Decodable, Identifiable{
    var id: String { name }
    let name: String
    let url: String
}
