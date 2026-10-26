import Foundation

struct PokemonSpecies: Decodable {
    let flavorTextEntries: [FlavorTextEntry]
}

struct FlavorTextEntry: Decodable {
    let flavorText: String
    let language: NamedResource
}
