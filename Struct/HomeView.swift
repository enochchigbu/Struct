// Home Screen, shown after account is created

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .schedules
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("STRUCT")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.red)
                Spacer()
                NavigationLink(destination: SettingsView()){
                    Text("Settings")
                        .foregroundColor(Color.red)
                }
            }
            Spacer()
            Group{
                if selectedTab == .schedules{
                    SchedulesView()
                }
                else if selectedTab == .account{
                    AccountView()
                }
                else{
                    FriendsView()
                }
                
            }.navigationBarBackButtonHidden(true)
            Spacer()
            TabBar(selectedTab: $selectedTab)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
