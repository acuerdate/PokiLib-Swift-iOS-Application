//
//  OtherSprites.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation

struct OtherSprites: Decodable {
    let officialArtwork: OfficialArtwork?
    
    enum CodingKeys: String, CodingKey{
        case officialArtwork = "official-artwork"
    }
}
