// User creation screen

import SwiftUI

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
            Button("Sign Up"){
                signUpAction()
            }
            .padding()
            .foregroundColor(Color.red)
            
            Spacer()
        }
    }
    
    func signUpAction(){
        if !firstName.isEmpty && !lastName.isEmpty {
            // Set user
            defaults.set(true, forKey: userCreatedAccountKey)
        }
    }
}


struct UserCreationView_Previews: PreviewProvider {
    static var previews: some View {
        UserCreationView()
    }
}
