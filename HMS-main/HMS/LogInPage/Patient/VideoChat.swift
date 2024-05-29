//
//  VideoChat.swift
//  LogInPage
//
//  Created by prakul agarwal on 28/05/24.
//

import SwiftUI

struct VideoChat: View {
    @State private var selectedAilment = "Not Selected"
    @State private var selectedSymptoms = "Not Selected"
    @State private var selectedDoctor = "Not Selected"
    @State private var selectedDate = Date()
    @State private var selectedPriority = "Not Selected"
    
    var ailments = ["Not Selected", "Ailment 1", "Ailment 2", "Ailment 3"]
    var symptoms = ["Not Selected", "Symptom 1", "Symptom 2", "Symptom 3"]
    var doctors = ["Not Selected", "Doctor 1", "Doctor 2", "Doctor 3"]
    var priorities = ["Not Selected", "High", "Medium", "Low"]
    
    var body: some View {
        Form {
            Picker("Ailment", selection: $selectedAilment) {
                ForEach(ailments, id: \.self) {
                    Text($0)
                }
            }
            
            Picker("Symptoms", selection: $selectedSymptoms) {
                ForEach(symptoms, id: \.self) {
                    Text($0)
                }
            }
            
            Picker("Doctor", selection: $selectedDoctor) {
                ForEach(doctors, id: \.self) {
                    Text($0)
                }
            }
            
            DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
            
            Button(action: {
                // Action for booking appointment
            }) {
                Text("Book an appointment")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationBarTitle("Video Chat")
    }
}

struct ContentView1: View {
    var body: some View {
        TabView {
            NavigationView {
                ClinicView()
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Today")
            }
            
            NavigationView {
                Text("Discover")
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Discover")
            }
            
            NavigationView {
                Text("Profile")
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

struct VideoChat_Previews: PreviewProvider {
    static var previews: some View {
        VideoChat()
    }
}
