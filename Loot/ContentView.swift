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

enum LooterFeature {
    case loot
    case wishList
    case profile
}

struct ContentView: View {
    @State private var selectedFeature: LooterFeature = .loot

    var body: some View {
        TabView(selection: $selectedFeature) {
            LootView()
                .tabItem {
                    Label("Loot", systemImage: "bag.fill")
                }
                .tag(LooterFeature.loot)
            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }
                .tag(LooterFeature.wishList)
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(LooterFeature.profile)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Inventory())
    }
}
