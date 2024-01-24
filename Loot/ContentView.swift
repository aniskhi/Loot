import SwiftUI
import Charts



class Inventory: ObservableObject {
    @Published var loot = lootItems

    func addItem(withItem item: LootItem) {
        loot.append(item)
    }
    
    var games: [Game] {
  
        Array(Set(loot.compactMap { $0.game })).sorted(by: { $0.name < $1.name })
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot, id: \.id) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
                        LootRow(item: item)
                    }
                }
                
                // Section pour le graphique en barres
                if !inventory.loot.isEmpty {
                    Section {
                        VStack(alignment: .leading) {
                            Text("STATISTIQUES")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .padding(.top)
                            
                            Text("Vos armes les plus puissantes")
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                            
                            Chart(inventory.loot) { item in
                                if let attackStrength = item.attackStrength {
                                    BarMark(
                                        x: .value("Arme", item.name),
                                        y: .value("Puissance", attackStrength)
                                    )
                                    .foregroundStyle(item.rarity.color)
                                }
                            }
                            .frame(height: 300)
                        }
                    }
                }

                // Section pour afficher vos jeux
                Section {
                    VStack(alignment: .leading) {
                        Text("VOS JEUX")
                            .font(.headline)
                            .padding(.vertical)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(inventory.games, id: \.id) { game in
                                    VStack {
                                        Image(game.coverName ?? "default_cover")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(8)
                                        Text(game.name)
                                            .font(.caption)
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Loot")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            }
            .sheet(isPresented: $showAddItemView) {
                AddItemView().environmentObject(inventory)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Inventory())
    }
}
