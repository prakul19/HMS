import SwiftUI

struct mainPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Home Screen")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }
            .navigationBarTitle("Home", displayMode: .large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        mainPageView()
    }
}
