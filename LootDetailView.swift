//
//  LootDetailView.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//
import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    @State private var animationAmount = 0.0
    var body: some View {
        // ContentView
        VStack{
            ItemDetailsHeader(item: item)
            Spacer()
            ItemDetailsList(item: item)
        }
    }
}

#Preview {
    LootDetailView(   item: LootItem(id: UUID.init(), quantity: 3, name: "Crystal Sword", type: .bow, rarity: .unique, attackStrength: 50, game: Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring")))
}
