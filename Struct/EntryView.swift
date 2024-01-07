// The first screen that a user will see upon opening the app
// If user's first time opening the app, the user creation screen will appear
// If not, then go to homeView

import SwiftUI

let userCreatedAccountKey = "userCreatedAccount"

let defaults = UserDefaults.standard

struct EntryView: View {
    @State private var animationComplete = false
    
    var body: some View {
        NavigationView{
            VStack {
                // Starting screen for the home screen on app boot
                if !animationComplete {
                    Text("Struct")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.red)
                        .onAppear {
                            // Perform any initial setup or animations
                            withAnimation(.easeInOut(duration: 1.0)) {
                                self.animationComplete = true
                            }
                        }
                }
                else {
                    // Show user account screen if first time opening app
                    if !defaults.bool(forKey: userCreatedAccountKey){
                        UserCreationView()
                    }
                    else{
                        HomeView()
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
    }
}
