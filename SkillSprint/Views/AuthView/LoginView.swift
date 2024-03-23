//
//  LoginView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 18/02/2024.
//

import SwiftUI

struct LoginView: View {
    
    // ViewModel
    @ObservedObject private var vm: LoginViewModel = LoginViewModel()
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        ZStack() {
            // BACKGROUND COLOR
            Color.white.ignoresSafeArea()
            // MAIN
            VStack(alignment: .leading, spacing: 0) {
                // TOP RECTANGLE
                ZStack(alignment: .top) {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 120, bottomTrailing: 0, topTrailing: 0))
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity)
                        .frame(height: 190)
                        .foregroundStyle(.main)
                    // LOGO
                    Image("SkillSprintLogoYellow")
                        .resizable()
                        .frame(width: 180, height: 180)
                }
                // HEADING
                Text("Login")
                    .foregroundStyle(.black)
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 25)
                    .padding(.top, 50)
                // SUBHEADING
                Text("Please enter your email and password")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .padding(.leading, 25)
                    .padding(.top, 5)
                // EMAIL FIELD
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email")
                        .foregroundStyle(.black)
                        .font(.caption)
                        .bold()
                    TextField("", text: $vm.loginEmailFieldValue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .padding(.horizontal, 10)
                        .background { Color.gray.opacity(0.15).clipShape(RoundedRectangle(cornerRadius: 12)) }
                        .foregroundStyle(.black)
                }
                .padding(.horizontal, 25)
                .padding(.top, 30)
                // PASSWORD FIELD
                VStack(alignment: .leading, spacing: 10) {
                    Text("Password")
                        .foregroundStyle(.black)
                        .font(.caption)
                        .bold()
                    TextField("", text: $vm.loginPasswordFieldValue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .padding(.horizontal, 10)
                        .background { Color.gray.opacity(0.15).clipShape(RoundedRectangle(cornerRadius: 12)) }
                        .foregroundStyle(.black)
                }
                .padding(.horizontal, 25)
                .padding(.top, 15)
                // FORGOT PASSWORD
                HStack(alignment: .center) {
                    Text(vm.loginErrorMessage)
                        .font(.caption)
                        .foregroundStyle(.red)
                        .opacity(vm.loginError ? 1 : 0)
                    Spacer()
                    Button {
                        // todo
                    } label: {
                        Text("Forgot password?")
                            .font(.caption)
                            .foregroundStyle(.main)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                // LOGIN BUTTON
                Button {
                    // todo
                    withAnimation(.spring(duration: 0.5)) {
                        self.isLoggedIn = true
                    }
                } label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background { Color.main.clipShape(RoundedRectangle(cornerRadius: 12)) }
                        .padding(.horizontal, 25)
                        .padding(.top, 10)
                }
                // FOOTER
                Spacer()
                HStack(spacing: 0) {
                    Text("Don't have an account? ")
                        .foregroundStyle(.black)
                        .font(.subheadline)
                    Button {
                        self.vm.popSignupSheet = true
                    } label: {
                        Text("Sign Up")
                            .foregroundStyle(.main)
                            .font(.headline)
                            .bold()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .top)
            .sheet(isPresented: $vm.popSignupSheet) { SignupSheet(vm: self.vm).presentationDetents([.fraction(0.75)]) }
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
