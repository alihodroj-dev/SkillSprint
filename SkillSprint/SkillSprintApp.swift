//
//  SkillSprintApp.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 15/02/2024.
//

import SwiftUI
import FirebaseCore

@main
struct SkillSprintApp: App {
    
    init() {
        // INITIALIZING FIREBASE
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}
