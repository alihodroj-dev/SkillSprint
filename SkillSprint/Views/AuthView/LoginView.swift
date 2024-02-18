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
    var body: some View {
        NavigationStack {
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
                        .fontWeight(.thin)
                        .padding(.leading, 25)
                        .padding(.top, 5)
                    // EMAIL FIELD
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Email")
                            .foregroundStyle(.black)
                            .font(.caption)
                            .bold()
                        TextField("", text: $vm.emailFieldValue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .padding(.horizontal, 10)
                            .background { Color.gray.opacity(0.15).clipShape(RoundedRectangle(cornerRadius: 12)) }
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 30)
                    // PASSWORD FIELD
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Password")
                            .foregroundStyle(.black)
                            .font(.caption)
                            .bold()
                        TextField("", text: $vm.passwordFieldValue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .padding(.horizontal, 10)
                            .background { Color.gray.opacity(0.15).clipShape(RoundedRectangle(cornerRadius: 12)) }
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 15)
                    // FORGOT PASSWORD
                    HStack(alignment: .center) {
                        Spacer()
                        Button {
                            // todo
                        } label: {
                            Text("Forgot password?")
                                .font(.caption)
                                .foregroundStyle(.main)
                        }
                    }
                    .padding(.trailing, 30)
                    .padding(.top, 10)
                    // LOGIN BUTTON
                    Button {
                        // todo
                    } label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background { Color.main.clipShape(RoundedRectangle(cornerRadius: 12)) }
                            .padding(.horizontal, 25)
                            .padding(.top, 15)
                    }
                    // FOOTER
                    Spacer()
                    HStack(spacing: 0) {
                        Text("Don't have an account? ")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                        Button {
                            // todo
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
            }
        }
    }
}

#Preview {
    LoginView()
}
