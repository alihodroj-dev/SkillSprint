//
//  SignUpView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 19/02/2024.
//

import SwiftUI

struct SignupSheet: View {
    
    // VIEWMODELS
    @ObservedObject var vm: LoginViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            // BACKGROUND COLOR
            Color.white.ignoresSafeArea()
            // MAIN
            VStack(alignment: .leading, spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        // HEADING
                        Text("Sign Up")
                            .foregroundStyle(.black)
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 25)
                            .padding(.top)
                        // SUBHEADING
                        Text("You are one step closer")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(.leading, 25)
                            .padding(.top, 5)
                        // NAME FIELD
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Full Name")
                                .foregroundStyle(.black)
                                .font(.caption)
                                .bold()
                            TextField("", text: $vm.signupFullnameFieldValue)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .padding(.horizontal, 10)
                                .background { Color.gray.opacity(0.15).clipShape(RoundedRectangle(cornerRadius: 12)) }
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, 30)
                        // EMAIL FIELD
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Email")
                                .foregroundStyle(.black)
                                .font(.caption)
                                .bold()
                            TextField("", text: $vm.signupEmailFieldValue)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .padding(.horizontal, 10)
                                .background { Color.gray.opacity(0.15).clipShape(RoundedRectangle(cornerRadius: 12)) }
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, 15)
                        // PASSWORD FIELD
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Password")
                                .foregroundStyle(.black)
                                .font(.caption)
                                .bold()
                            TextField("", text: $vm.signupPasswordFieldValue)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .padding(.horizontal, 10)
                                .background { Color.gray.opacity(0.15).clipShape(RoundedRectangle(cornerRadius: 12)) }
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, 15)
                        // CONFIRM PASSWORD FIELD
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Confirm Password")
                                .foregroundStyle(.black)
                                .font(.caption)
                                .bold()
                            TextField("", text: $vm.signUpConfirmPasswordFieldValue)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .padding(.horizontal, 10)
                                .background { Color.gray.opacity(0.15).clipShape(RoundedRectangle(cornerRadius: 12)) }
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, 15)
                        // ERROR STATEMENT
                        Text(vm.signupErrorMessage)
                            .foregroundStyle(.red)
                            .font(.caption)
                            .opacity(vm.signupError ? 1 : 0)
                            .padding(.horizontal, 25)
                            .padding(.top, 10)
                        // SIGNUP BUTTON
                        Button {
                            // creating new user
                            if(!vm.signupEmailFieldValue.isEmpty && !vm.signupPasswordFieldValue.isEmpty && !vm.signUpConfirmPasswordFieldValue.isEmpty) {
                                FireBaseManager.shared.signUpUser(emailValue: vm.signupEmailFieldValue, passwordValue: vm.signupPasswordFieldValue) { result in
                                    if(result) {
                                        vm.popSignupSheet = false
                                    } else {
                                        vm.signupErrorMessage = "Error creating new user"
                                        withAnimation { vm.signupError = true }
                                    }
                                }
                            } else {
                                vm.signupErrorMessage = "All fields must be filled"
                                withAnimation { vm.signupError = true }
                            }
                        } label: {
                            Text("Sign Up")
                                .foregroundStyle(.white)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .background { Color.main.clipShape(RoundedRectangle(cornerRadius: 12)) }
                                .padding(.horizontal, 25)
                                .padding(.top, 10)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    SignupSheet(vm: LoginViewModel())
}
