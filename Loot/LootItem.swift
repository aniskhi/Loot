//
//  LootItem.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//
import Foundation
import SwiftUI

struct LootItem: Hashable, Identifiable{
    var id: UUID
    
    var quantity: Int = 1
    var name: String = ""
    var type: ItemType = ItemType.bow
    var rarity: Rarity = Rarity.unique
    var attackStrength: Int?
    var game: Game = Game.emptyGame
}

enum ItemType: String, CaseIterable{
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
}

// Définition d'un tableau 'lootItems' qui contiendra des objets 'LootItem'
let lootItems: [LootItem] = [
    // Création d'un 'LootItem' avec des attributs spécifiques
    LootItem(id: UUID.init(), // Identifiant unique pour l'objet de butin
             quantity: 3, // Quantité de cet objet
             name: "Crystal Sword", // Nom de l'objet
             type: .magic, // Type de l'objet (magique)
             rarity: .epic, // Rareté de l'objet (épique)
             attackStrength: 50, // Force d'attaque de l'objet
             game: Game(name: "Elden Ring", // Jeu associé à cet objet
                        genre: .rpg, // Genre du jeu (RPG)
                        coverName: "elden_ring")), // Nom de la couverture du jeu

    // Création d'un autre 'LootItem' avec des attributs similaires
    LootItem(id: UUID.init(),
             quantity: 1,
             name: "Flame Bow",
             type: .fire,
             rarity: .legendary,
             attackStrength: 70,
             game: Game(name: "Skyrim",
                        genre: .rpg,
                        coverName: "skyrim")),

    // Création d'un autre 'LootItem'
    LootItem(id: UUID.init(),
             quantity: 5,
             name: "Ice Dagger",
             type: .ice,
             rarity: .rare,
             attackStrength: 30,
             game: Game(name: "WoW",
                        genre: .mmorpg,
                        coverName: "wow")),

    // Création d'un autre 'LootItem'
    LootItem(id: UUID.init(),
             quantity: 2,
             name: "Wind Cloak",
             type: .wind,
             rarity: .uncommon,
             attackStrength: 10,
             game: Game(name: "Diablo IV",
                        genre: .looter,
                        coverName: "diablo_IV")),

    // Création d'un autre 'LootItem'
    LootItem(id: UUID.init(),
             quantity: 4,
             name: "Poison Ring",
             type: .poison,
             rarity: .unique,
             attackStrength: 20,
             game: Game(name: "CS:GO",
                        genre: .fps,
                        coverName: "CSGO"))
    
    
]
