//
//  WaterTrackerView.swift
//  Hydrate1
//
//  Created by Rimah Saleh Alwanin on 15/02/2024.
//

import SwiftUI

struct WaterTrackerView: View {
// Replace these with your actual data and methods
@State private var currentIntake: Double = 0.0
@State private var intakeGoal: Double = 2.7
@State private var progress: Double = 0.0

var body: some View {
    NavigationView {
        VStack {
                Text("Today's Water Intake")
                    .foregroundColor(.gray)
                    .padding(.leading, -170)
                Text(String(format: "%.1f liter / %.1f liter", currentIntake, intakeGoal))
                .font(.system(size: 30))
                .bold()
                .padding(.leading, -100)
                .padding(.top)

            // Water intake progress display
            ZStack {
                Circle()
                    .stroke(lineWidth: 50)
                    .opacity(0.3)
                    .foregroundColor(Color.calcButton)
                

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.calcButton)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: progress)
                if progress >= 1.0 {
                    Text("😁")
                        .font(.system(size: 60))
                        .offset(x: 0, y: -60)
                } else {
                    Text("😴")
                        .font(.system(size: 60))
                        .offset(x: 0, y: -60)
                }
            }
            .padding(.all, 20.0)

            HStack {
                Button(action: {
                    // Decrement action
                    self.changeWaterIntake(by: -0.1)
                }) {
                    Image(systemName: "minus")
                        .font(.title)
                }
                .buttonStyle(PlainButtonStyle())

                Spacer()

                Text("\(String(format: "%.1f", currentIntake))")
                    .font(.title)

                Spacer()

                Button(action: {
                    // Increment action
                    self.changeWaterIntake(by: 0.1)
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 40.0)

            Spacer()

            Text("Swipe right for cups calculating")
                .foregroundColor(.gray)
                .gesture(DragGesture(minimumDistance: 100)
                    .onEnded({ _ in
                        // Navigate to cup calculations
                    }))
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "gear"))
        .padding()
    }
}

func changeWaterIntake(by amount: Double) {
    // Add validation to ensure currentIntake does not go below 0 or above intakeGoal
    currentIntake += amount
    currentIntake = min(max(currentIntake, 0), intakeGoal)
    progress = currentIntake / intakeGoal
}
}

struct WaterTrackerView_Previews: PreviewProvider {
static var previews: some View {
WaterTrackerView()
}
}
