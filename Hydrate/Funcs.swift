//
//  Funcs.swift
//  Hydrate
//
//  Created by Taala on 04/08/1445 AH.
//

import Foundation

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

func calculateCup(cupsNumber: Double, targetCupsNumber: Double) -> Double {
    let Cup = cupsNumber / targetCupsNumber
     return Cup
 }






let weight = 70.0 // to test
let todayIntake = 2.0 // to test
let cups = 4.0 // to test
let liters = 1.0 // to test 
