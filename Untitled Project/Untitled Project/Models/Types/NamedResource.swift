//
//  NamedResource.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation

struct NamedResource: Decodable, Identifiable{
    var id: String { name }
    let name: String
}
