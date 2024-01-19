//
//  AddItemView.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var selectedRarity: Rarity = .common
    @State private var selectedGame: Game = .emptyGame
    @State private var quantity: Int = 1
    @State private var selectedType: ItemType = .unknown
    @State private var hasAttack: Bool = false
    @State private var attackStrength: Int = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ajouter un loot")) {
                    TextField("Nom de l'objet", text: $name)
                    
                    Picker("Rareté", selection: $selectedRarity) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(rarity.rawValue.capitalized)
                        }
                    }
                    
                    Picker("Jeu", selection: $selectedGame) {
                        Text("Non spécifié").tag(Game.emptyGame)
                        ForEach(availableGames, id: \.id) { game in
                            Text(game.name).tag(game)
                        }
                    }
                    Stepper("Combien : \(quantity)", value: $quantity, in: 1...99)
                    
                    Picker("Type", selection: $selectedType) {
                        ForEach(ItemType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    
                    Toggle("Item d'attaque ?", isOn: $hasAttack)
                    
                    if hasAttack {
                        Stepper("Force d'attaque : \(attackStrength)", value: $attackStrength, in: 0...100)
                    }
                }
                
                Section {
                    Button("Ajouter l'objet") {
                        let newItem = LootItem(
                            quantity: quantity, name: name,
                            type: selectedType,
                            rarity: selectedRarity,
                            attackStrength: hasAttack ? attackStrength : nil,
                            game: selectedGame
                        )
                        inventory.addItem(item: newItem)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Ajouter un loot")
        }
    }
}


enum Rarity: String, CaseIterable {
    case common, uncommon, rare, epic, legendary, unique
    
    var color: Color {
        switch self {
        case .common: return .gray
        case .uncommon: return .green
        case .rare: return .blue
        case .epic: return .purple
        case .legendary: return .orange
        case .unique: return .red
        }
    }
}

#Preview {
    ContentView()
}
