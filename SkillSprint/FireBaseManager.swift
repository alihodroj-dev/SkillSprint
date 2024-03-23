//
//  FireBaseManager.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 22/02/2024.
//

import Foundation
import FirebaseAuth

class FireBaseManager {
    
    //  SINGLETON
    static let shared = FireBaseManager()
    
    // CHECK IF SIGNED IN
    func checkIfSignedIn() -> Bool {
        if(Auth.auth().currentUser != nil) { return true } else { return false }
    }
    
    // SIGN IN USER
    func signInUser(emailValue: String, passwordValue: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: emailValue, password: passwordValue) { result, err in
            if let _ = err { completion(false) } else { completion(true) }
        }
    }
    
    func signUpUser(emailValue: String, passwordValue: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: emailValue, password: passwordValue) { result, err in
            if let _ = err { completion(false) } else { completion(true) }
        }
    }
}
