//
//  SchedulesCalendarView.swift
//  Struct
//
//  Created by Enoch Chigbu on 1/10/24.
//

import SwiftUI

let currentEventKey = "currentEvent"

struct Event : Codable {
    var id = UUID()
    var title : String
    var startTime : Date
    var endTime : Date
    var startDate: Date
    var endDate : Date
    var days : [Int] // Days, integer array with 7 places, 0 : selected, 1 : Not Selected
    
    init(title: String, startTime: Date, endTime: Date, startDate: Date, endDate: Date, days: [Int]) {
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.startDate = startDate
        self.endDate = endDate
        self.days = days
    }
    
    func getTimeDifference(_ startTime: Date, _ endTime: Date) -> String {
        let timeInterval = endTime.timeIntervalSince(startTime)
        let hours = Int(timeInterval / 3600)
        let minutes = Int((timeInterval / 60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct SchedulesCalendarView: View {
    var body: some View {
        ZStack{
            List{
                Text("Event 1")
                Text("Event 2")
                Text("Event 3")
            }
        }
    }
}

//struct SchedulesCalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchedulesCalendarView()
//    }
//}
