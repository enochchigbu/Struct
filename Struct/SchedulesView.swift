//
//  SchedulesView.swift
//  Struct
//
//  Created by Enoch Chigbu on 1/8/24.
//

import SwiftUI

let sampleEvent = Event(
    title: "Gym",
    startTime: Date(),
    endTime: Date().addingTimeInterval(3600),
    startDate: Date(),
    endDate: Date().addingTimeInterval(24 * 3600),
    days: [0, 1, 0, 1, 0, 1, 0]
)

struct SchedulesView: View {
    var body: some View {
        VStack{
            Spacer()
            Text(sampleEvent.title)
                .font(.system(size: 50))
            Spacer()
            Text(sampleEvent.getTimeDifference(sampleEvent.startTime, sampleEvent.endTime))
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
