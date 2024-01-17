//
//  SchedulesView.swift
//  Struct
//
//  Created by Enoch Chigbu on 1/8/24.
//

import SwiftUI

struct SchedulesView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Title")
                .font(.system(size: 50))
            Spacer()
            Text("Time Remaining")
                .font(.system(size: 60))
                .multilineTextAlignment(.center)
            Text("Time Range")
                .font(.system(size:20))
                .padding(20)
            Spacer()
            NavigationLink(destination: SchedulesCalendarView()){
                Text("Edit Schedule")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
            }.padding(.bottom, 20)
        }
    }
}

//struct SchedulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchedulesView()
//    }
//}
