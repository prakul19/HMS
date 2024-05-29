import SwiftUI

struct OTPVerificationView: View {
    @State private var otpCode: [String] = ["", "", "", "", "", ""]
    @State private var errorMessage = ""
    @State private var showingLoginScreen = false
    var email: String

    var body: some View {
        VStack(spacing: 20) {
            Text("OTP Verification")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.green)
            
            Text("Hello User,")
            Text("Thank you for registering with us. Please type the OTP shared on your email \(email).")
                .multilineTextAlignment(.center)
            
            HStack(spacing: 10) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $otpCode[index])
                        .frame(width: 50, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                }
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: resendOTP) {
                Text("Resend")
                    .foregroundColor(Color.green)
            }
            
            Button(action: submitOTP) {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(100)
            }
        }
        .padding()
        .background(
            NavigationLink(
                destination: LogInScreen(),
                isActive: $showingLoginScreen
            ) {
                EmptyView()
            }
        )
    }
    
    func resendOTP() {
        // Code to resend OTP
    }

    func submitOTP() {
        let otpString = otpCode.joined()
        NetworkManager.shared.verifyOTP(email: email, otp: otpString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.showingLoginScreen = true
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
