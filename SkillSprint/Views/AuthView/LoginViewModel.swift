//
//  LoginViewModel.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 18/02/2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    // LOGIN UI
    @Published var loginEmailFieldValue: String = ""
    @Published var loginPasswordFieldValue: String = ""
    @Published var loginError: Bool = false
    @Published var loginErrorMessage: String = ""
    
    // SIGNUP UI
    @Published var signupEmailFieldValue: String = ""
    @Published var signupPasswordFieldValue: String = ""
    @Published var signUpConfirmPasswordFieldValue: String = ""
    @Published var signupFullnameFieldValue: String = ""
    @Published var signupError: Bool = false
    @Published var signupErrorMessage: String = ""
    
    // NAVIGATION
    @Published var popSignupSheet: Bool = false
    @Published var goToHomeView: Bool = false
}
