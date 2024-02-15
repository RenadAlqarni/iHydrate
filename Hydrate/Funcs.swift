//
//  Funcs.swift
//  Hydrate
//
//  Created by Taala on 04/08/1445 AH.
//

import Foundation

public func calculateTarget(weight: Double) -> Double {
    let targetIntake = weight * 0.03
    return targetIntake
}

public func calculateDrinkingProgress(todayIntake: Double, targetIntake: Double) -> Double {
    let drinkingProgress = todayIntake / targetIntake
    return drinkingProgress
}

public func cupsToLiters(cups: Double) -> Double {
    let liters = cups * 0.24
    return liters
}

public func litersToCups(liters: Double) -> Double {
    let cups = liters / 0.24
    return cups
}

public func calculateCup(cupsNumber: Double, targetCupsNumber: Double) -> Double {
    let Cup = cupsNumber / targetCupsNumber
     return Cup
 }






let weight = 70.0 // to test
let todayIntake = 2.0 // to test
let cups = 4.0 // to test
let liters = 1.0 // to test 
