//
//  LootItem.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//
import Foundation
import SwiftUI

struct LootItem: Identifiable, Hashable {
    var id = UUID()
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



enum ItemType: String, Identifiable, CaseIterable{
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
    
    var id: String { self.rawValue }
}

