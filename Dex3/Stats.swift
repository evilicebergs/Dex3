//
//  Stats.swift
//  Dex3
//
//  Created by Artem Golovchenko on 2024-09-27.
//

import SwiftUI
import Charts

struct Stats: View {
    @EnvironmentObject var pokemon: Pokemon
    //Adding an object to a view’s environment makes the object available to subviews in the view’s hierarchy
    var body: some View {
        Chart(pokemon.stats) { stat in
            BarMark(
                x: .value("Value", stat.value),
                y: .value("Stat", stat.label)
            )
            .annotation(position: .trailing) {
                Text("\(stat.value)")
                    .padding(.top, -5)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
            }
        }
        .frame(height: 200)
        .padding([.leading, .bottom, .trailing])
        .foregroundStyle(Color((pokemon.types![0] as? String)!.capitalized))
        .chartXScale(domain: 0...pokemon.highestStat.value + 8)
    }
}

#Preview {
    Stats()
        .environmentObject(SamplePokemon.samplePokemon)
}
