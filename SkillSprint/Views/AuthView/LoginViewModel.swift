//
//  LoginViewModel.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 18/02/2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var emailFieldValue: String = ""
    @Published var passwordFieldValue: String = ""
}
