//
//  LowerSection.swift
//  Untitled Project
//
//  Created by 11 on 26.10.2026.
//

import SwiftUI

struct LowerSection: View {
    var pokemon: PokemonDetail
    var descriptionText: String
    let capsule = Colors()
    
    var body: some View {
        
        //MARK: - Desc
        VStack(alignment: .leading, spacing: 8) {
            Text("DESCRIPTION")
                .font(.default).bold().foregroundStyle(.secondary)
            
            Text(descriptionText)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
        
        //MARK: - Stats
        VStack(alignment: .leading, spacing: 12){
            Text("BASE STATS")
                .font(.default).bold().foregroundStyle(.secondary)
            
            ForEach(pokemon.stats, id: \.stat.name) { stat in
                HStack(spacing: 10) {
                    Text(stat.stat.name.shortStatName)
                        .font(.caption)
                        .frame(width: 25, alignment: .leading)
                    
                    Text("\(stat.baseStat)")
                        .font(.caption)
                        .frame(width: 25, alignment: .trailing)
                    
                    ProgressView(value: Float(stat.baseStat), total: 255.0)
                        .tint(capsule.typeColor(pokemon.primaryType))
                        .scaleEffect(x: 1, y: 1.5, anchor: .center)
                }
            }
        }
    }
}
