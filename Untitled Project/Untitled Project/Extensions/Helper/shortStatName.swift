import Foundation

extension String {
    var shortStatName: String {
        switch self {
        case "hp": return "HP"
        case "attack": return "ATK"
        case "defense": return "DEF"
        case "special-attack": return "SPA"
        case "special-defense": return "SPD"
        case "speed": return "SPE"
        default: return self.uppercased()
        }
    }
}
