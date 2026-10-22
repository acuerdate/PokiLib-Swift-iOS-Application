//
//  Colors.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation
import SwiftUI

final class Colors{
    func typeColor(_ type: String) -> Color{
        switch type.lowercased(){
        case "fire": return Color.orange
        case "water": return Color.blue
        case "grass": return Color.green
        case "electric": return Color.yellow
        case "psychic": return Color.purple
        case "ice": return Color.cyan
        case "dragon": return Color.indigo
        case "dark": return Color.brown
        case "fairy": return Color.pink
        case "fighting": return Color.red
        case "poison": return Color.purple
        case "ground": return Color.brown
        case "flying": return Color.teal
        case "bug": return Color.green
        case "rock": return Color.gray
        case "ghost": return Color.indigo
        case "steel": return Color.gray
        case "normal": return Color.secondary
        default: return Color.gray
        }
    }
}
