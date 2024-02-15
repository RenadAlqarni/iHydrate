//
//  ProgressRingView.swift
//  Hydrate Watch App
//
//  Created by Taala on 04/08/1445 AH.
//

import SwiftUI

struct ProgressRingView: View {
    let targetIntake: Double = 50
        @State private var todayIntake: Double = 30
    var body: some View {
        VStack {
            
            ProgressView(value: todayIntake , total: targetIntake) {
                Text(String(format: "%.1f", todayIntake))
//                Text(String(format: "%.1f", targetIntake))
//                    .font(.title)
            }
                .scaleEffect(3)
                .tint(.blue)
                .progressViewStyle(CircularProgressViewStyle())
        }
            HStack(alignment: .bottom) {
                
                Button(action: {
                    if todayIntake > 0 {
                        todayIntake -= 1
                                    }
                                })
                {
                   Image(systemName: "minus")
                                }
                  .frame(width: 40, height: 40)
                   .clipShape(Circle())
                
                Spacer()
                
                Button(action: {
                        todayIntake += 1
                               })
                {
                    Image(systemName: "plus")
                               }
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                           }
                
            
        }
    }

func calculateTarget(weight: Double) -> Double {
    let targetIntake = weight * 0.03
    return targetIntake
}

func calculateDrinkingProgress(todayIntake: Double, targetIntake: Double) -> Double {
    let drinkingProgress = todayIntake / targetIntake
    return drinkingProgress
}

func cupsToLiters(cups: Double) -> Double {
    let liters = cups * 0.24
    return liters
}

func litersToCups(liters: Double) -> Double {
    let cups = liters / 0.24
    return cups
}

#Preview {
    ProgressRingView()
}
