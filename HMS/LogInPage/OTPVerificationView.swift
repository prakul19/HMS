//
//  verification.swift
//  LogInPage
//
//  Created by prakul agarwal on 28/05/24.
//

import SwiftUI

struct OTPVerificationView: View {
    @State private var otpCode: [String] = ["", "", "", "", "", ""]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("OTP Verification")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.green)
            
            Text("Hello User,")
            Text("Thank you for registering with us. Please type the OTP shared on your mobile xxxxxxxx123.")
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
        .navigationBarBackButtonHidden(true) // Hides the back button
    }
    
    func resendOTP() {
        // Code to resend OTP
    }

    func submitOTP() {
        // Code to submit entered OTP
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           OTPVerificationView()
        }
    }
}
