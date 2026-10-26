//
//  HeaderSection.swift
//  Untitled Project
//
//  Created by 11 on 26.10.2026.
//

import SwiftUI

struct HeaderSection: View {
    var pokemon: PokemonDetail
    let capsule = Colors()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundStyle(.primary)
                
                Text(pokemon.primaryType.capitalized.uppercased())
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                    .background(capsule.typeColor(pokemon.primaryType).opacity(0.3))
                    .foregroundStyle(capsule.typeColor(pokemon.primaryType))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
            
            AsyncImage(url: pokemon.imageURL){phase in
                switch phase{
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                        .foregroundStyle(.primary)
                default:
                    ProgressView()
                }
            }
            .frame(width: 150, height: 150)
        }
        
    //MARK: - BASE Stats
        HStack(spacing: 0){
            VStack(spacing: 4){
                Text("HEIGHT")
                    .font(.footnote).bold().foregroundStyle(.secondary)
                Text(String(format: "%.1f m", Double(pokemon.height) / 10.0))
                    .font(.default)
            }
            .frame(maxWidth: .infinity)
            
            Divider().frame(height: 30)
                .overlay(.gray)
                .fontWeight(.bold)
            
            VStack(spacing: 4){
                Text("WEIGHT")
                    .font(.footnote).bold().foregroundStyle(.secondary)
                Text(String(format: "%.1f kg", Double(pokemon.weight) / 10.0))
                    .font(.default)
            }
            .frame(maxWidth: .infinity)
            
            Divider().frame(height: 30)
                .overlay(.gray)
                .fontWeight(.bold)
            
            VStack(spacing: 4){
                Text("ABILITY")
                    .font(.footnote).bold().foregroundStyle(.secondary)
                
                Text(pokemon.abilities.first(where: { !$0.isHidden })?.ability.name.capitalized ?? "None")
                    .font(.default)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(15)
    }
}

