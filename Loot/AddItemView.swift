//
//  AddItemView.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//
import SwiftUI


struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) private var dismiss
    @State private var valid: Bool = false
    @State private var name: String = ""
    @State private var rarity: Rarity = .common
    @State private var game: Game = .emptyGame
    @State private var quantity: Int = 1
    @State private var typeItem: ItemType = .bow
    @State private var attackItem: Bool = false
    @State private var attackStrength: Int = 0

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $name)
                    Picker("Rarete", selection: $rarity) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(rarity.rawValue.capitalized)
                        }
                    }
                }

                Section {
                    Picker("Jeu", selection: $game) {
                        Text("Non spécifié").tag(Game.emptyGame)
                        ForEach(availableGames, id: \.self) { game in
                            Text(game.name).tag(game)
                        }
                    }
                    Stepper("Combien : \(quantity)", value: $quantity, in: 1...50)
                }
                Section {
                    HStack(){
                        Text("Type")
                        Spacer()
                        Text("\(typeItem.rawValue)")
                    }
                    Picker("Type", selection: $typeItem){
                        ForEach(ItemType.allCases, id: \.self) { theItem in
                            Text(String(describing: theItem.rawValue).capitalized)
                        }
                    }.pickerStyle(.palette)
                }
                Section {
                    Toggle(isOn: $attackItem) {
                        Text("Item d'attaque ?")
                    }
                    if attackItem {
                        Stepper("Force d'attaque : \(attackStrength)", value: $attackStrength, in: 1...50)
                    }
                }

                Section {
                    Button("Ajouter") {
                        if name.count >= 3 {
                            let newItem = LootItem(
                                id: UUID(),
                                quantity: quantity,
                                name: name,
                                type: typeItem,
                                rarity: rarity,
                                attackStrength: attackItem ? attackStrength : nil,
                                game: game
                            )
                            inventory.addItem(withItem: newItem)
                            dismiss()
                        } else {
                            valid = true
                        }
                    }
                    .alert(isPresented: $valid) {
                        Alert(
                            title: Text("Nom incorrecte"),
                            message: Text("Le nom doit faire au minimum 3 caractères"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            }
            .navigationTitle("Ajouter un objet")
            .navigationBarItems(trailing: Button("Fermer") { dismiss() })
        }
    }
}


enum Rarity: String, CaseIterable {
    case common = "common"
    case uncommon = "uncommon"
    case rare = "rare"
    case epic = "epic"
    case legendary = "legendary"
    case unique = "unique"

    var color: Color {
        switch self {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.orange
        case .unique:
            return Color.red
        }
    }
    
}

#Preview {
    AddItemView()
}
