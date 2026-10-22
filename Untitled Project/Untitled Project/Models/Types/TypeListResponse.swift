//
//  TypeListResponse.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation

struct TypeListResponse: Decodable{
    let count: Int
    let results: [NamedResource]
}
