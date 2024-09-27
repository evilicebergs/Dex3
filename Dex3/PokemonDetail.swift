//
//  PokemonDetail.swift
//  Dex3
//
//  Created by Artem Golovchenko on 2024-09-27.
//

import SwiftUI
import CoreData

struct PokemonDetail: View {
    
    @EnvironmentObject var pokemon: Pokemon
    
    @State var showShiny = false
    
    var body: some View {
        ScrollView {
            ZStack {
                Image(pokemon.background)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black, radius: 6)
                AsyncImage(url: showShiny ? pokemon.shiny : pokemon.sprite) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 50)
                        .shadow(color: .black, radius: 6)
                } placeholder: {
                    ProgressView()
                }
            }
            HStack {
                ForEach(pokemon.types!, id: \.self) { type in
                    Text(type.capitalized)
                        .font(.title2)
                        .shadow(color: .white, radius: 2)
                        .padding([.top, .bottom], 7)
                        .padding([.leading, .trailing])
                        .background(Color(type.capitalized))
                        .clipShape(.rect(cornerRadius: 50))
                    
                }
                Spacer()
            }
            .padding()
            
        }
        .navigationTitle(pokemon.name!.capitalized)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showShiny.toggle()
                } label: {
                    Image(systemName: showShiny ? "wand.and.stars" : "wamd.and.stars.inverse")
                        .foregroundStyle(showShiny ? .yellow : .clear)
//                    if showShiny {
//                        Image(systemName: "wand.and.stars")
//                            .foregroundStyle(.yellow)
//                    } else {
//                        Image(systemName: "wamd.and.stars.inverse")
//                    }
                }
            }
        }
    }
}

#Preview {
    PokemonDetail()
        .environmentObject(SamplePokemon.samplePokemon)
}
