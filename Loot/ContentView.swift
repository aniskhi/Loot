//
//  ContentView.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//

import Foundation
import SwiftUI

class Inventory : ObservableObject {

    @Published var loot = lootItems
    
    func addItem(withItem item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(inventory.loot, id: \.self) { item in
                    NavigationLink{
                        LootDetailView(item: item)
                    }label: {
                        LootRow(item: item)
                    }

                }
            }.navigationBarTitle("Loot")
            .toolbar(content: {
                    ToolbarItem(placement: ToolbarItemPlacement.automatic){
                        Button(action: {
                            showAddItemView.toggle()
                        },
                               label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
        }
    }
}


#Preview {
    ContentView()
}

