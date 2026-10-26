import Foundation

struct PokemonDetail: Decodable, Identifiable{
    let id: Int
    let name: String
    let height: Int
    let weight: Int 
    let sprites: Sprites
    let types: [TypeSlot]
    let abilities: [AbilitySlot]
    let stats: [StatSlot]
    
    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
    }
    
    var primaryType: String{
        types.first?.type.name ?? "unknown"
    }
}

struct AbilitySlot: Decodable{
    let ability: NamedResource
    let isHidden: Bool
}

struct StatSlot: Decodable{
    let baseStat: Int
    let stat: NamedResource
}

