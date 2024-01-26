//
//  OnBoarding.swift
//  Loot
//
//  Created by Anis KHIARI on 1/26/24.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingDone: Bool
    @State private var currentPageIndex = 0
    
    var body: some View {
        TabView(selection: $currentPageIndex) {
            OnboardingPageView(
                title: "Gérer ses loots",
                description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle.",
                iconName: "bag.circle.fill", // Icône SF pour la première page
                buttonLabel: "Suivant",
                isLastPage: false,
                isOnboardingDone: $isOnboardingDone,
                action: { withAnimation { currentPageIndex = 1 } }
            )
            .tag(0)
            OnboardingPageView(
                title: "Votre wishlist",
                description: "Créez une liste de souhaits pour garder une trace des articles que vous voulez acquérir.",
                iconName: "wand.and.stars", // Icône SF pour la deuxième page
                buttonLabel: "Suivant",
                isLastPage: false,
                isOnboardingDone: $isOnboardingDone,
                action: { withAnimation { currentPageIndex = 2 } }
            )
            .tag(1)
            OnboardingPageView(
                title: "En un coup d'oeil",
                description: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de votre appareil.",
                iconName: "iphone.circle", // Icône SF pour la troisième page
                buttonLabel: "Commencer",
                isLastPage: true,
                isOnboardingDone: $isOnboardingDone,
                action: { isOnboardingDone = true }
            )
            .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.default, value: currentPageIndex)
    }
}

struct OnboardingPageView: View {
    let title: String
    let description: String
    let iconName: String // Icône SF
    let buttonLabel: String
    let isLastPage: Bool
    @Binding var isOnboardingDone: Bool
    var action: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image(systemName: iconName) // Utilisation de l'icône SF Symbol
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100) // Taille de l'icône
                .foregroundColor(.blue) // Couleur de l'icône
            Text(description)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Button(action: {
                if isLastPage {
                    isOnboardingDone = true
                } else {
                    action()
                }
            }) {
                Text(buttonLabel)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue) // Couleur du bouton
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 50)
    }
}
