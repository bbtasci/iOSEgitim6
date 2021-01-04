//
//  Zoo.swift
//  MyZoo
//
//  Created by Baris Berkin Tasci on 21.12.2020.
//

class Zoo {
    var animals: [Animal] = []
    private var waterConsumptionLimit: Int = 500
    private var totalConsumedWater: Int = 0
    
    func addNewAnimal(newAnimal: Animal) {
        animals.append(newAnimal)
        totalConsumedWater += newAnimal.water
    }
    
    func countAnimals() -> Int {
        return animals.count
    }
    
    func getTotalConsumedWater() -> Int {
        return totalConsumedWater
    }
    
    func getWaterLimit() -> Int {
        return waterConsumptionLimit
    }
}
