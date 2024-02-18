//
//  WaterIntakeVeiw.swift
//  Hydrate
//
//  Created by Renad Alqarni on 15/02/2024.
//

import SwiftUI

struct WaterIntakeView: View {
    @State private var waterGoal: Double = 2.4
    @State private var cupsGoal = 12

    var body: some View {
        NavigationStack{
            VStack {
                Text("The needed water intake")
                    .font(.title)
                    .bold()
                
                Text("Your body needs \(waterGoal, specifier: "%.1f") liters of hydration, which is equivalent to \(cupsGoal) cups")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.leading,30)
                
                HStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.backgroundRectangle.opacity(0.2))
                        .frame(width: 171, height: 159)
                        .overlay(
                            VStack {
                                Image("Cups")
                                    .resizable()
                                    .frame(width: 50,height: 70)
                                Text("\(cupsGoal) cups")
                                    .font(.title2)
                                .padding(.leading)}
                        )
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.backgroundRectangle.opacity(0.2))
                        .frame(width: 171, height: 159)
                        .overlay(
                            VStack {
                                Image("Liters")
                                    .resizable()
                                    .frame(width: 50,height: 70)
                                Text("\(waterGoal, specifier: "%.1f")L")
                                    .font(.title2)
                                .padding(.trailing)})
                }
                
                
                
                Button(action: {
                    //Set notification
                }) {
                    NavigationLink(destination: NotificationView()){
                        Text("Set the notification")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(.calcButton))
                            .cornerRadius(10)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    WaterIntakeView()
}

//RoundedRectangle(cornerRadius: 5)
//    .fill(Color.backgroundRectangle.opacity(0.2))
//    .overlay(
//        HStack {
//            Image("Cups")
//        }
//    )

//            Image("Cups")
//                .resizable()
//                .frame(width: 171, height: 159)
//                .background(Rectangle().fill(Color(.backgroundRectangle)))
//                .cornerRadius(8)
