//
//  LootApp.swift
//  Loot
//
//  Created by Anis KHIARI on 1/19/24.
//

import SwiftUI

@main
struct LootApp: App {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false

    var body: some Scene {
        WindowGroup {
            if isOnboardingDone {
                ContentView()
            } else {
                OnboardingView(isOnboardingDone: $isOnboardingDone)
            }
        }
    }
}
