//
//  pokemonCard.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: PokemonDetail
    let capsule = Colors()
    var onTap: () -> Void 
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 8){
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .font(.system(size: 17))
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }
                AsyncImage(url: pokemon.imageURL){ phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                            .foregroundStyle(.secondary)
                    default:
                        ProgressView()
                    }
                }
                .frame(height: 90)
                .frame(maxWidth: .infinity)
                
                Text(pokemon.name.capitalized)
                    .font(.headline)
                
                Text(pokemon.primaryType.capitalized.uppercased())
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                    .background(capsule.typeColor(pokemon.primaryType).opacity(0.2))
                    .foregroundStyle(capsule.typeColor(pokemon.primaryType))
                    .clipShape(Capsule())
                
            }
        }
        .buttonStyle(.plain)
        .frame(width: 150)
        .padding()
        .background(.gray.opacity(0.15))
        .cornerRadius(20)
    }
}

#Preview {
    HomeView()
}
