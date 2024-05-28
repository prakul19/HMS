//
//  SignUp.swift
//  LogInPage
//
//  Created by prakul agarwal on 27/05/24.
//

import SwiftUI

struct CreateAccountScreen: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var gender: String = ""
    @State private var dateOfBirth: String = ""
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer() // Pushes everything downwards
                
                VStack(alignment: .leading) {
                    Text("Create Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.leading) // Align to left with some padding
                        .padding(.bottom, 20)
                    
                    Group {
                        HStack {
                            TextField("First Name", text: $firstName)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            
                            TextField("Last Name", text: $lastName)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        TextField("Gender", text: $gender)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        TextField("Date of Birth", text: $dateOfBirth)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        TextField("Email ID", text: $emailID)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                
                Spacer() // Pushes the button upwards
                
                NavigationLink(destination: OTPVerificationView()) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom, 40) // Adjust this value to move the button higher or lower
   
                
            }
            .navigationBarTitle("", displayMode: .inline)
            
        }
    }
}

struct NextScreen: View {
    var body: some View {
        Text("This is the next screen")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountScreen()
    }
}
