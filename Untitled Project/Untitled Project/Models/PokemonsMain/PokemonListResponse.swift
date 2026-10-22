//
//  Models.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation

struct PokemonListResponse: Decodable{
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItem]
}

