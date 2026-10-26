//
//  PokemonDetailSheet.swift
//  Untitled Project
//
//  Created by 11 on 26.10.2026.
//

import Foundation
import SwiftUI

struct PokemonDetailSheet: View{
    var pokemon: PokemonDetail
    var capsule = Colors()
    @StateObject private var vm = PokemonDetailViewModel()
    
    var body: some View{
        ScrollView {
            VStack{
                
                //DetailedScreenComponents
                HeaderSection(pokemon: pokemon)
                
                LowerSection(pokemon: pokemon, descriptionText: vm.descriptionText)
                
                
            }
            .padding()
        }
        .presentationDetents([.fraction(0.75)])
        .padding(.horizontal)
        .task {
            await vm.fetchDescription(for: pokemon.id)
        }
    }
}

#Preview{
    HomeView()
}
