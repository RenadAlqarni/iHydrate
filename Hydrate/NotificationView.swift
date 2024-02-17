//
//  NotificationView.swift
//  Hydrate
//
//  Created by Renad Alqarni on 15/02/2024.
//

import SwiftUI

struct NotificationView: View {
    @State var startH = Date()
    @State var endH = Date()
    @State private var selectedInterval: Int? = nil
    let intervals: [[Int]] = [[15, 30, 60, 90], [2, 3, 4, 5]]
    var body: some View {
        NavigationStack{
            
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
                                .background(Color("backgroundRectangle"))
                                .labelsHidden()
                                .cornerRadius(15)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("End Hour")
                                .font(.title2)
                                .padding(.leading, -120.0)
                            
                            DatePicker("", selection: $endH, displayedComponents: .hourAndMinute)
                                .background(Color("backgroundRectangle"))
                                .labelsHidden()
                                .cornerRadius(15)
                        }})
            
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
//                                        .frame(width: 100, height: 200)
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
        }
    }
}

#Preview {
    NotificationView()
}


