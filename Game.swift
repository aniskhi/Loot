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
    Game(name: "Elden Ring", genre: .rpg, coverName: nil),
    Game(name: "Skyrim", genre: .rpg, coverName: nil),
    Game(name: "WoW", genre: .mmorpg, coverName: nil),
    Game(name: "CS:GO", genre: .fps, coverName: nil),
    Game(name: "GTA V", genre: .looter, coverName: nil),
    Game(name: "Kakarot", genre: .looter, coverName: nil),
    Game(name: "Fifa", genre: .looter, coverName: nil)

]
