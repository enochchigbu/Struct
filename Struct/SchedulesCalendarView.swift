//
//  SchedulesCalendarView.swift
//  Struct
//
//  Created by Enoch Chigbu on 1/10/24.
//

import SwiftUI
import CoreData

let currentEventKey = "currentEvent"

struct SchedulesCalendarView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    // Fetch request injection to get events
    @FetchRequest(
        entity: Event.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Event.startDate, ascending: true),
            NSSortDescriptor(keyPath: \Event.startTime, ascending: true)
        ]
    ) var events: FetchedResults<Event>
    
    @State private var isAddEventsPopupVisible = false;
    @State private var isRemoveEventsPopupVisible = false;
    
    var body: some View {
        ZStack{
            VStack{
                List(events) { event in
                    Text(event.title ?? "Event")
                    Text(event.id?.uuidString ?? "ID")
                }
                HStack{
                    Spacer()
                    Button("Add Event"){
                        isAddEventsPopupVisible = true
                    }.foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 150)
                        .background(Color.red)
                        .cornerRadius(15)
                        .popover(isPresented: $isAddEventsPopupVisible){
                            AddEventsPopupView()
                        }
                    Spacer()
                    Button("Remove Events", action: removeEvents)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 150)
                        .background(Color.red)
                        .cornerRadius(15)
                    Spacer()
                }
                .padding(.vertical, 20)
            }
        }
    }
    
    func removeEvents(){
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        do {
            let events = try managedObjectContext.fetch(fetchRequest)
            for event in events {
                managedObjectContext.delete(event)
            }
            try managedObjectContext.save()
        } catch {
            print("Error removing events: \(error)")
        }
    }
}

struct AddEventsPopupView : View {
    // Core data injection
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // State variables for data input
    @State var titleInput : String = ""
    @State var startDateInput: Date = Date()
    @State var endDateInput : Date = Date()
    @State var startTimeInput : Date = Date()
    @State var endTimeInput : Date = Date()
    @State var oneTimeInput : String = ""
    @State var daysInput : [Bool] = []
    
    enum Day: String, CaseIterable {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
        case sunday = "Sunday"
    }
    
    var body : some View{
        ZStack{
            VStack{
                Text("Add a new event here")
                    .font(.title)
                Spacer()
                TextField("Title", text: $titleInput)
                    .multilineTextAlignment(.center)
                    .overlay(
                        Divider()
                    )
                VStack{
                    DatePicker("Start Date",
                               selection: $startDateInput,
                               displayedComponents: [.date]
                    ).padding(20)
                    DatePicker("End Date",
                               selection: $endDateInput,
                               displayedComponents: [.date]
                    ).padding(20)
                }.padding(20)
                VStack{
                    DatePicker("Start Time",
                               selection: $startTimeInput,
                               displayedComponents: [.hourAndMinute]
                    ).padding(20)
                    DatePicker("End Time",
                               selection: $endTimeInput,
                               displayedComponents: [.hourAndMinute]
                    ).padding(20)
                }.padding(20)
                Spacer()
                Button("Confirm"){
                    
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(15)
                .padding(.horizontal, 20)
            }
        }.padding(10)
    }
    
    func addEvents(){
        let event = Event(context: managedObjectContext)
        event.id = UUID()
        try? managedObjectContext.save()
    }
}

struct RemoveEventsPopupView : View {
    // Core data injection with fetchRequest, sorting events by date, then time
    @Environment(\.managedObjectContext) var managedObjectContext
    var body : some View {
        VStack{
            Text("Remove Events")
        }
    }
    
    
    func removeEvents(){
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        do {
            let events = try managedObjectContext.fetch(fetchRequest)
            for event in events {
                managedObjectContext.delete(event)
            }
            try managedObjectContext.save()
        } catch {
            print("Error removing events: \(error)")
        }
    }
}



//struct SchedulesCalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchedulesCalendarView()
//    }
//}
