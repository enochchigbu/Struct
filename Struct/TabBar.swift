//
//  TabView.swift
//  Struct
//
//  Created by Enoch Chigbu on 1/7/24.
//

import SwiftUI



import SwiftUI

enum Tab: String, CaseIterable {
    case schedules
    case friends
    case account
    case settings
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
    VStack {
       HStack {
         ForEach(Tab.allCases, id: \.rawValue) { tab in
             Spacer()
             Text("tab")
             Spacer()
           }
        }
        .frame(width: nil, height: 60)
        .background(.thinMaterial)
        .cornerRadius(10)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
     static var previews: some View {
         TabBar(selectedTab: .constant(.schedules))
     }
}
