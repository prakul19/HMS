//
//  ContentView.swift
//  LogInPage
//
//  Created by prakul agarwal on 27/05/24.
//


import SwiftUI

struct LogInScreen: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding(10)
                    
                    Text("Hosp Connect")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.green)
                }
                .offset(y: 80)
                VStack{
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .frame(height: 60)
                        .padding(.horizontal)
                    
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .frame(height: 60)
                        .padding(.horizontal)
                    
                    HStack {
                        Button(action: {
                            // Handle forgot password action
                        }) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.green)
                        }
                        Spacer()
                        NavigationLink(destination: CreateAccountScreen()) {
                            Text("Don't have an account?")
                                .font(.footnote)
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.horizontal)
                }
                .offset(y:120)
                Spacer()

                Button(action: {
                    // Handle sign-in action
                }) {
                    HStack {
                        Spacer()
                        Text("Sign In")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(100)
                }
                .padding(.horizontal)
                .offset(y: -60)
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}
