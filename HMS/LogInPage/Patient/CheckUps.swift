//
//  CheckUps.swift
//  LogInPage
//
//  Created by prakul agarwal on 28/05/24.
//

import SwiftUI

struct CheckUpsView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Check-ups")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
            }
            .padding()
            
            CustomSegmentedControl(selectedIndex: $selectedTab, titles: ["Clinic visit", "Video chats"])
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if selectedTab == 0 {
                        Text("Upcoming Appointments")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        AppointmentRow(appointment: Appointment(type: "Hypertension", name: "Hypertension", date: "12 May 2024", time: "09:45 am"))
                            .padding(.horizontal)
                    }
                    
                    Text("Previous Appointments")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ForEach(previousAppointments) { appointment in
                        AppointmentRow(appointment: appointment)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .background(Color(.systemGray6))
    }
}

struct AppointmentRow: View {
    let appointment: Appointment
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading) {
                Text(appointment.name)
                    .font(.headline)
                Text(appointment.type)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(appointment.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(appointment.time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 1)
    }
}

struct Appointment: Identifiable {
    let id = UUID()
    let type: String
    let name: String
    let date: String
    let time: String
}

let previousAppointments = [
    Appointment(type: "Hypertension", name: "Daniel Bryant", date: "12 May 2024", time: "09:55 am"),
    Appointment(type: "Hypertension", name: "Daniel Bryant", date: "12 May 2024", time: "09:45 am"),
    Appointment(type: "Hypertension", name: "Daniel Bryant", date: "12 May 2024", time: "09:35 am"),
    Appointment(type: "Hypertension", name: "Daniel Bryant", date: "11 May 2024", time: "09:45 am")
]

struct CustomSegmentedControl: UIViewRepresentable {
    @Binding var selectedIndex: Int
    var titles: [String]

    class Coordinator: NSObject {
        var parent: CustomSegmentedControl

        init(parent: CustomSegmentedControl) {
            self.parent = parent
        }

        @objc func valueChanged(_ sender: UISegmentedControl) {
            parent.selectedIndex = sender.selectedSegmentIndex
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UISegmentedControl {
        let control = UISegmentedControl(items: titles)
        control.selectedSegmentIndex = selectedIndex
        control.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        control.selectedSegmentTintColor = UIColor.systemGreen
        
        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        control.setTitleTextAttributes(normalTextAttributes, for: .normal)
        control.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        return control
    }

    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        uiView.selectedSegmentIndex = selectedIndex
    }
}

struct CheckUpsView_Previews: PreviewProvider {
    static var previews: some View {
        CheckUpsView()
    }
}
