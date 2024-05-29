import SwiftUI

struct LogInScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showingHomeView = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
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
                
                VStack {
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
                .offset(y: 120)
                
                Spacer()
                
                Button(action: {
                    login()
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
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .padding()
            .background(
                NavigationLink(
                    destination: HomeView(),
                    isActive: $showingHomeView
                    
                ) {
                    EmptyView()
                }
            )
        }
        .navigationBarBackButtonHidden(true)

    }
    
    func login() {
        NetworkManager.shared.login(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    // If login is successful, navigate to the main page view
                    self.showingHomeView = true
                case .failure(let error):
                    // If login fails, display an error message
                    self.errorMessage = "Incorrect email or password. Please try again."
                    print(error.localizedDescription)
                    // Do not set showingHomeView to true to prevent redirection
                }
            }
        }
    }
    
}
struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}
