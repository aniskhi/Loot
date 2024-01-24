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
    @State var valid : Bool = false
    @State var name = ""
    @State var rarity = Rarity.common
    @State var game = Game.emptyGame
    @State var quantity: Int = 1
    @State var typeItem: ItemType = ItemType.bow
    @State var attackItem: Bool = false
    @State var attackStrength: Int = 1
    var body: some View {
        Form {
            Section{
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity){
                    ForEach(Rarity.allCases, id: \.self){ rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $game){
                    Text(String(describing: "Non spécifié").capitalized)
                    ForEach(availableGames, id: \.self){game in
                        Text(String(describing: game.name).capitalized)
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
            Section{
                Toggle(isOn: $attackItem){
                    Text("Item d'attaque ?")
                }
                if attackItem {
                    Stepper("Force d'attaque : \(attackStrength)", value: $attackStrength, in: 1...50)
                }
                
                
            }
            Section{
                Button(action: {

                    if(name.isEmpty){
                        valid = true
                    }
                    else {
                        inventory.addItem(withItem: LootItem(id: UUID.init() ,quantity: quantity, name: name, type: typeItem, rarity: rarity, game: game))
                        dismiss()
                    }

                }, label: {
                    Text("Ajouter")
                })
                .alert(
                    isPresented: $valid
                ){
                    Alert(
                        title: Text("Nom incorrecte "),
                        message: Text("Le nom doit faire au minimum 3 caractères")
                    )
                }
            }
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
