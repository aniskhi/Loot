//
//  ContentView.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//
import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = [LootItem]()
    init() {
        self.loot = [
                LootItem(name: "Épée enflammée", type: .fire, rarity: .legendary, attackStrength: 50, game: availableGames[0]),
                LootItem(name: "Bouclier de glace", type: .ice, rarity: .epic, attackStrength: nil, game: availableGames[1]),
                LootItem(name: "Arc de vent", type: .wind, rarity: .rare, attackStrength: 40, game: availableGames[2]),
                LootItem(name: "Poignard empoisonné", type: .poison, rarity: .unique, attackStrength: 30, game: availableGames[3]),
                LootItem(name: "Éclair magique", type: .thunder, rarity: .epic, attackStrength: 60, game: availableGames[4]),
                LootItem(name: "Dague de l'ombre", type: .dagger, rarity: .rare, attackStrength: 45, game: availableGames[5]),
                LootItem(name: "Bouclier", type: .shield, rarity: .legendary, attackStrength: nil, game: availableGames[0]),
                LootItem(name: "Arc céleste", type: .bow, rarity: .epic, attackStrength: 55, game: availableGames[1]),
                LootItem(name: "Anneau de puissance", type: .ring, rarity: .unique, attackStrength: nil, game: availableGames[2]),
                LootItem(name: "Épée mystérieuse", type: .unknown, rarity: .rare, attackStrength: 42, game: availableGames[3])
            ]
        }
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView = false

    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    showAddItemView.toggle()
                }, label: {
                    Text("Ajouter")
                })
                ForEach(inventory.loot) { item in
                    
                    VStack(alignment: .leading){
                        
                        HStack {
                            
                            Circle()
                            
                                .fill(item.rarity.color)
                                .frame(width: 10, height: 10)
                            Text(item.name)
                                .foregroundColor(item.rarity.color)
                            Spacer()

                            Text(item.type.rawValue)
                                .padding(.trailing)
                            
                        }
                        Text("Quantité : \(item.quantity)")

                    }
                }
            }
            .navigationBarTitle("Inventaire")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddItemView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView()
                    .environmentObject(inventory)
            })
            ForEach(inventory.loot) { item in
                NavigationLink(destination: LootDetailView(item: item)) {
                    Text(item.name)
                }
            }
        }
    }
}



#Preview {
    ContentView()
}

