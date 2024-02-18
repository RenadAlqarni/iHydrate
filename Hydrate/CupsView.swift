//
//  CupsView.swift
//  Hydrate1
//
//  Created by Rimah Saleh Alwanin on 15/02/2024.
//


import SwiftUI

struct CupsView: View {
    
    @State private var currentIntake: Double = 0
    @State private var intakeGoal: Double = 20
    @State private var progress: Double = 0

    let cupsNumber: Double = 3
    let targetCupsNumber: Double = 8
    
    var body: some View {
        VStack {
            Text("Today's Water Intake")
                .foregroundColor(.gray)
                .padding(.leading, -170)
            
            Text(String(format: "%.1f cups / %.1f cups", currentIntake, intakeGoal))
                .font(.system(size: 30))
                .bold()
                .padding(.leading, -70)
                .padding(.top)
       
            Text("Today \(calculateProgress() * 100)%")
            
            VStack(spacing: 50) {
                ForEach(0..<4) { row in
                    HStack(spacing: 55) {
                        ForEach(0..<4) { col in
                            VStack {
                                Image(systemName: "drop.fill")
                                    .font(.system(size: 45))
                                    .foregroundColor(calculateProgress() >= 0.25 ? .blue : .gray)
                                Text("Cup \(row * 4 + col + 1)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .font(.system(size: 100))
        }
    }
    
    func calculateProgress() -> Double {
        let progress = cupsNumber / targetCupsNumber
        return progress
    }
}

struct CupsView_Previews: PreviewProvider {
    static var previews: some View {
        CupsView()
    }
}
