//
//  LoadingView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 15/02/2024.
//

import SwiftUI
import FirebaseAuth

struct LoadingView: View {
    
    // ANIMATION STATES
    @State private var backgroundColorFadeFactor: Double = 1.0
    @State private var logoFadeFactor: Double = 1.0
    @State private var logoScaleFactor: Double = 1.0
    @State private var logoRotationFactor: Angle = .degrees(0)
    
    // Navigation
    @State private var isLoggedIn: Bool = Auth.auth().currentUser != nil
    
    var body: some View {
        // MAIN CONTAINER
        ZStack {
            HomeView(isLoggedIn: $isLoggedIn)
                .opacity(isLoggedIn ? 1 : 0)
            LoginView(isLoggedIn: $isLoggedIn)
                .offset(x: isLoggedIn ?  UIScreen.main.bounds.width : 0)
                .opacity(isLoggedIn ? 0 : 1)
            // BACKGROUND COLOR
            Color.main.ignoresSafeArea()
                .opacity(self.backgroundColorFadeFactor)
            // LOGO IMAGE
            Image("SkillSprintLogoYellow")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(self.logoScaleFactor)
                .opacity(self.logoFadeFactor)
                .rotationEffect(self.logoRotationFactor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            // SPIN ANIMATION
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(duration: 0.5).delay(0).repeatCount(3, autoreverses: true)) {
                    self.logoRotationFactor = .degrees(180)
                }
            }
            // SCALE ANIMATION
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.75) {
                withAnimation(.spring(duration: 0.5)) {
                    self.logoScaleFactor = 0.8
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.spring) {
                        self.logoScaleFactor = 30
                        self.logoFadeFactor = 0
                        self.backgroundColorFadeFactor = 0
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
