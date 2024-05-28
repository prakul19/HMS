//
//  profile.swift
//  LogInPage
//
//  Created by prakul agarwal on 28/05/24.
//

import SwiftUI

struct ProfileView1: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) { // Removed spacing to eliminate gap
                // Profile Image with background matching list color
                ZStack(alignment: .top) {
                    Color(UIColor.systemGroupedBackground)
                        .frame(height: 150)
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .offset(y: 40) // Adjust the vertical position of the image
                }
                
                // Menu List
                List {
                    Section {
                        NavigationLink(destination: Text("Edit Profile")) {
                            Text("Edit Profile")
                        }
                        NavigationLink(destination: Text("Notifications")) {
                            Text("Notifications")
                        }
                        NavigationLink(destination: Text("Appointments")) {
                            Text("Health Details")
                        }
                    }
                    
                    Section {
                        NavigationLink(destination: Text("My Prescriptions")) {
                            Text("My Prescriptions")
                        }
                        NavigationLink(destination: Text("About us")) {
                            Text("About us")
                        }
                        NavigationLink(destination: Text("Help Centre")) {
                            Text("Help Centre")
                        }
                    }
                    
                    // Logout Button
                    Button(action: {
                        // Handle logout action here
                    }) {
                        HStack {
                            Spacer()
                            Text("Log out")
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                        }
                        .background(Color.red)
                        .cornerRadius(10)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(InsetGroupedListStyle()) // Apply the InsetGroupedListStyle for rounded borders
            }
            .navigationTitle("Profile") // Set the navigation title here
            .navigationBarHidden(false) // Ensure the navigation bar is not hidden
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView1()
    }
}
