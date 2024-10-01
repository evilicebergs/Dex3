//
//  SamplePokemon.swift
//  Dex3
//
//  Created by Artem Golovchenko on 2024-09-27.
//

import Foundation
import CoreData

struct SamplePokemon {
    //value context should be in the main actor
    @MainActor
    static let samplePokemon = {
            let context = PersistenceController.preview.container.viewContext
            let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
            fetchRequest.fetchLimit = 1
            
            let results = try! context.fetch(fetchRequest)
            return results.first!
    }()
}
