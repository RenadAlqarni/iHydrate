//
//  CupsView.swift
//  Hydrate Watch App
//
//  Created by Taala on 04/08/1445 AH.
//

import SwiftUI

struct CupsView: View {
    let cupsNumber: Double = 3
    let targetCupsNumber: Double = 8
    
    var body: some View {
        VStack{
            Text("Today \(calculateCup(cupsNumber: cupsNumber, targetCupsNumber: targetCupsNumber) * 100)")
            Image(systemName: "drop.fill")
                .font(.system(size: 100))

        }
    }
}

func calculateCup(cupsNumber: Double, targetCupsNumber: Double) -> Double {
    let Cup = cupsNumber / targetCupsNumber
     return Cup
 }

#Preview {
    CupsView()
}
