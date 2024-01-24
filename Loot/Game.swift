//
//  Game.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring"),
    Game(name: "Skyrim", genre: .rpg, coverName: "skyrim"),
    Game(name: "WoW", genre: .mmorpg, coverName: "wow"),
    Game(name: "CS:GO", genre: .fps, coverName: "CSGO"),
    Game(name: "GTA V", genre: .looter, coverName: "GTA"),
    Game(name: "Kakarot", genre: .looter, coverName: "Kakarot"),
    Game(name: "Fifa", genre: .looter, coverName: "Fifa")

]
