//
//  Pokemon+Ext.swift
//  Dex3
//
//  Created by Artem Golovchenko on 2024-09-27.
//

import Foundation

extension Pokemon {
    var background: String {
        switch self.types![0] as? String {
        case "normal", "grass", "electric", "poison", "fairy":
            return "normalgrasselectricpoisonfairy"
        case "rock", "ground", "steel", "fighting", "ghost", "dark", "psychic":
            return "rockgroundsteelfightingghostdarkpsychic"
        case "fire", "dragon":
            return "firedragon"
        case "flying", "bug":
            return "flyingbug"
        case "ice":
            return "ice"
        case "water":
            return "water"
        default:
            return "hi"
        }
    }
    var stats: [Stat] {
        [
            Stat(id: 1, label: "HP", value: self.hp),
            Stat(id: 2, label: "Attack", value: self.attack),
            Stat(id: 3, label: "Defence", value: self.defence),
            Stat(id: 4, label: "Special Attack", value: self.specialAttack),
            Stat(id: 5, label: "Special Defence", value: self.specialDefence),
            Stat(id: 6, label: "Speed", value: self.speed)
        ]
    }
    var highestStat: Stat {
        stats.max { $0.value < $1.value }!
    }
//    func organizeTypes() {
//        if self.types!.count == 2 && self.types![0] as? String == "normal" {
//            //self.types!.swapAt(0, 1)
//            let temp = types![0]
//            types![0] = types![1]
//            types![1] = temp
//        }
//    }
}

struct Stat: Identifiable {
    let id: Int
    let label: String
    let value: Int16
}
