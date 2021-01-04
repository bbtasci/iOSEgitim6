//
//  ZooBuilder.swift
//  MyZoo
//
//  Created by Baris Berkin Tasci on 21.12.2020.
//

class ZooBuilder {
    
    private let zooNew = Zoo()
    
    init() {
        let cat = Animal()
        let dog = Animal()
        let lion = Animal()
        let rhinoceros = Animal()
        
        cat.name = "Cat"
        cat.water = 10
        cat.voice = "Meow!"
        
        dog.name = "Dog"
        dog.water = 20
        dog.voice = "Bark!"
        
        lion.name = "Lion"
        lion.water = 50
        lion.voice = "Roar!"
        
        rhinoceros.name = "Rhinoceros"
        rhinoceros.water = 100
        rhinoceros.voice = "Bellow!"
        
        zooNew.addNewAnimal(newAnimal: cat)
        zooNew.addNewAnimal(newAnimal: dog)
        zooNew.addNewAnimal(newAnimal: lion)
        zooNew.addNewAnimal(newAnimal: rhinoceros)
    }
    
    func getZooNew() -> Zoo {
        return zooNew
    }
}
