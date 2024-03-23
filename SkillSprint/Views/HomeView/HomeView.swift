//
//  HomeView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 22/02/2024.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    // VIEWMODEL
    @ObservedObject private var vm: HomeViewModel = HomeViewModel()
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        VStack {
            Text("Home")
            Button {
                do {
                    try Auth.auth().signOut()
                    withAnimation(.spring(duration: 0.5)) {
                        isLoggedIn = false
                    }
                } catch {
                    
                }
            } label: {
                Text("Logout")
            }
        }
        
    }
}

#Preview {
    HomeView(isLoggedIn: .constant(true))
}
