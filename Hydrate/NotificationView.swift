//
//  NotificationView.swift
//  Hydrate
//
//  Created by Renad Alqarni on 15/02/2024.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success , error in
            if success {
                print ("Access granted!")
            } else if let error = error {
                print (error.localizedDescription)
            }
        }
    }
    
    func sendNotification(date: Date,type: String, startHour: Date , endHour: Date , timeInterval: Double = 10, title: String, body: String) {
        var trigger: UNNotificationTrigger?
        if type == "date" {
            let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        } else if type == "time" {
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct NotificationView: View {
    @State var startH = Date()
    @State var endH = Date()
    @State private var selectedInterval: Int? = nil
    let intervals: [[Int]] = [[15, 30, 60, 90], [2, 3, 4, 5]]
    let notify = NotificationManager()
    
    init() {
        notify.askPermission()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Notification Preferences")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                    .padding(.leading,-30)
                
                Text("The start and End hour")
                    .font(.title3)
                    .bold()
                    .padding(.leading,-140)
                
                Text("Specify the start and end date to receive the notifications")
                    .padding(.leading,10)
                    .font(.title3)
                    .foregroundColor(.gray)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("backgroundRectangle"))
                    .frame(width: 350, height: 130)
                    .overlay(
                        VStack{
                            HStack {
                                Text("Start Hour")
                                    .font(.title2)
                                    .padding(.leading, -120.0)
                                
                                DatePicker("", selection: $startH, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .background(Color("backgroundRectangle"))
                                    .cornerRadius(1)
                            }
                            
                            Divider()
                            
                            HStack {
                                Text("End Hour")
                                    .font(.title2)
                                    .padding(.leading, -120.0)
                                
                                DatePicker("", selection: $endH, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .accentColor(Color("backgroundRectangle"))
                                    .cornerRadius(1)
                            }
                        })
                
                Text("Notification interval")
                    .font(.title3)
                    .bold()
                    .padding(.leading,-150)
                
                Text("How often would you like to receive notifications within the specified time interval")
                    .padding(.leading,1)
                    .font(.title3)
                    .foregroundColor(.gray)
                
                VStack {
                    HStack (spacing: 20){
                        ForEach(intervals[0], id: \.self) { interval in
                            Button(action: {
                                selectedInterval = interval
                            }) {
                                Text("\(interval)\nMins")
                                    .font(.title3)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("backgroundRectangle"))
                                    )
                                    .background(selectedInterval == interval ? Color("CalcButton") : Color.white)
                                    .foregroundColor(selectedInterval == interval ? .white : .black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    HStack {
                        ForEach(intervals[1], id: \.self) { interval in
                            Button(action: {
                                selectedInterval = interval
                            }) {
                                Text("\(interval)\nHours")
                                    .font(.title3)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("backgroundRectangle")))
                                    .background(selectedInterval == interval ? Color("CalcButton") : Color.white)
                                    .foregroundColor(selectedInterval == interval ? .white : .black)
                                    .cornerRadius(10)
                                
                            }
                        }
                    }
                }
                
                Button(action: {
                                if let interval = selectedInterval {
                                    let timeInterval = interval >= 15 ? (interval) * 60  : (interval) * 3600
                                    notify.sendNotification(
                                        date: Date(),
                                        type: "time" ,
                                        startHour: startH,
                                        endHour: endH,
                                        timeInterval: Double(timeInterval),
                                        title: "Hey there!",
                                        body: "Take a sip to stay on track!")
                                }
                            }) {
                                NavigationLink(destination: WaterTrackerView()) {
                                                Text("Start")
                                                    .frame(width: 250, height: 10)
                                                    .padding()
                                                    .foregroundColor(.white)
                                                    .background(Color("CalcButton"))
                                                    .cornerRadius(10)
                                            }
                                        }
                                    }
                   }
                }
}

#Preview {
    NotificationView()
}

