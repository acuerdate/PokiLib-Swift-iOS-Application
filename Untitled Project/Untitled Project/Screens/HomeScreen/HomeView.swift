import SwiftUI
import Playgrounds

struct HomeView: View {
    @StateObject var vm = ViewModel()
    @State private var selectedType: String? = nil
    @State private var selectedPokemon: PokemonDetail? = nil 
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack{
            if vm.isLoading {
                Spacer()
                ProgressView("Loading...")
                Spacer()
            }else{
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading, spacing: 0) {
                        SearchField()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8){
                                ForEach(vm.pokemonTypes){capsule in
                                    FilterCapsule(
                                        types: capsule,
                                        isSelected: selectedType == capsule.name
                                    ) {
                                        if selectedType == capsule.name {
                                            selectedType = nil
                                        } else {
                                            selectedType = capsule.name
                                        }
                                    }
                                }
                            }
                        }
                        
                        LazyVGrid(columns: columns, spacing: 10){
                            ForEach(vm.pokemonsList){pokemon in
                                PokemonCard(pokemon: pokemon, onTap: {
                                    selectedPokemon = pokemon
                                })
                            }
                        }
                        .padding(.vertical)
                    }
                    .background(.background)
                    .navigationTitle("Home")
                    .padding(.horizontal)
                }
            }
        }
        .sheet(item: $selectedPokemon){pokemon in
            PokemonDetailSheet(pokemon: pokemon)
        }
        
        .task {
            if vm.pokemonsList.isEmpty{
                await vm.FetchPokemonCards()
                await vm.FetchPokemonTypes()
            }
        }
    }
}


#Preview {
    HomeView()
}

