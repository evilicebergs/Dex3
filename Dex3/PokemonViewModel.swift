//
//  PokemonViewModel.swift
//  Dex3
//
//  Created by Artem Golovchenko on 2024-09-25.
//

import Foundation

@MainActor

class PokemonViewModel: ObservableObject {
    enum Status {
        case norStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    @Published private(set) var status = Status.norStarted
    
    private let controller: FetchController
    
    init(controller: FetchController) {
        self.controller = controller
        Task {
            await getPokemon()
        }
    }
    
    private func getPokemon() async {
        status = .fetching
        do {
            guard var pokedex = try await controller.fetchAllPokemon() else {
                print("Pokemon have already been got")
                status = .success
                return
            }
            
            pokedex.sort { $0.id < $1.id }
            
            for pokemon in pokedex {
                let newPokemon = Pokemon(context: PersistenceController.shared.container.viewContext)
                newPokemon.id = Int16(pokemon.id)
                newPokemon.name = pokemon.name
                newPokemon.types = pokemon.types as NSArray
                //newPokemon.organizeTypes()
                newPokemon.hp = Int16(pokemon.hp)
                newPokemon.attack = Int16(pokemon.attack)
                newPokemon.defence = Int16(pokemon.defence)
                newPokemon.specialAttack = Int16(pokemon.specialAttack)
                newPokemon.specialDefence = Int16(pokemon.specialDefence)
                newPokemon.speed = Int16(pokemon.speed)
                newPokemon.sprite = pokemon.sprite
                newPokemon.shiny = pokemon.shiny
                newPokemon.favorite = false
                
                try PersistenceController.shared.container.viewContext.save()
            }
            status = .success
        } catch {
            status = .failed(error: error)
        }
    }
}
