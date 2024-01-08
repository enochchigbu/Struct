// Home Screen, shown after account is created

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack{
            Text("STRUCT")
                .font(.largeTitle)
                .bold()
            Spacer()
            Text("Placeholder")
        }
        Spacer()
        NavigationView{
            Text("Hello \(defaults.string(forKey: firstNameKey) ?? "User")!")
            Spacer()
        }.navigationBarBackButtonHidden(true)
        Spacer()
        TabBar(selectedTab: .constant(.schedules))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
