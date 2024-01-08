// User creation screen

import SwiftUI

let firstNameKey = "firstName"
let lastNameKey = "lastName"
let birthDateKey = "birthDate"

struct UserCreationView: View {
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var birthDate : Date = Date()
    
    var body: some View {
        VStack{
            Text("Welcome to Struct!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Spacer()
            Section{
                TextField("First Name", text: $firstName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last Name", text: $lastName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker("Select Birthday", selection: $birthDate, displayedComponents: .date)
                    .padding()
            }
            Spacer()
            if !firstName.isEmpty && !lastName.isEmpty{
                NavigationLink(destination: HomeView()){
                    Text("Sign Up")
                        .padding()
                        .foregroundColor(Color.red)
                }.simultaneousGesture(TapGesture().onEnded {
                    defaults.set(true, forKey: userCreatedAccountKey)
                    defaults.set(firstName, forKey: firstNameKey)
                    defaults.set(lastName, forKey: lastNameKey)
                })
            }
            Spacer()
        }
    }
}


struct UserCreationView_Previews: PreviewProvider {
    static var previews: some View {
        UserCreationView()
    }
}
