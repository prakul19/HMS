import SwiftUI

struct CreateAccountScreen: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var gender: String = ""
    @State private var dateOfBirth: String = ""
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showingOTPVerification = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Create Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.leading)
                        .padding(.bottom, 20)
                    Button(action: {
                                    
                                   }) {
                                       NavigationLink(destination: LogInScreen()) {
                                           Image(systemName: "chevron.left")
                                               .resizable()
                                               .frame(width: 12, height: 20)
                                       
                                               .foregroundColor(.blue)
                                       }
                                   }
                                   .offset(x: 20, y: -180)
               
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
                            .textContentType(.oneTimeCode) // Disabling auto password generation
                        
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .textContentType(.oneTimeCode) // Disabling auto password generation
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Button(action: {
                    registerPatient()
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom, 40)
            }
            .navigationBarTitle("", displayMode: .inline)
            .background(
                NavigationLink(
                    destination: OTPVerificationView(email: emailID),
                    isActive: $showingOTPVerification
                ) {
                    EmptyView()
                }
            )
        }
        .navigationBarBackButtonHidden()
    }
    
    func registerPatient() {
        NetworkManager.shared.registerPatient(firstName: firstName, lastName: lastName, gender: gender, dob: dateOfBirth, email: emailID, password: password, confirmPassword: confirmPassword) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.showingOTPVerification = true
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

#Preview{
    CreateAccountScreen()
}
