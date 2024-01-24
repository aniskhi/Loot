//
//  LootDetailView.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(item.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                if let coverName = item.game.coverName, let image = UIImage(named: coverName) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(height: 58)
                        .cornerRadius(8)
                        .overlay(
                            Image(systemName: "rectangle.slash")
                                .foregroundColor(.black.opacity(0.4))
                        )
                }

                Group {
                    Text("In-game : \(item.name)")
                    Text("Puissance (ATQ) : \(item.attackStrength ?? 0)")
                    Text("Possédé(s) : \(item.quantity)")
                    Text("Rareté : \(item.rarity.rawValue)")
                }
                .font(.title2)
            }
            .padding()
        }
        .navigationTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    LootDetailView(item: <#LootItem#>)
}
