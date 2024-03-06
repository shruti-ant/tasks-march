import UIKit
import Foundation

/*
 Vehicle Management System:
 Create a hierarchy of classes representing different types of vehicles such as Car, Truck, Motorcycle, etc. Include properties like make, model, year, and functionalities like starting the engine, stopping the engine, and accelerating.
 */

class Vehicle {
    let make: String
    let model: String
    let year: Int
    var isEngineRunning: Bool = false
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
    
    func startEngine() {
        if isEngineRunning == false {
            isEngineRunning = true
            print("\(make) \(model) engine started.")
        } else {
            print("\(make) \(model) engine is already running.")
        }
    }
    
    func stopEngine() {
        if isEngineRunning {
            isEngineRunning = false
            print("\(make) \(model) engine stopped.")
        } else {
            print("\(make) \(model) engine is already stopped.")
        }
    }
    
    func accelerate() {
        if isEngineRunning {
            print("\(make) \(model) is accelerating.")
        } else {
            print("Start the engine first to accelerate \(make) \(model).")
        }
    }
}

class Car: Vehicle {
    var color: UIColor
    
    init(make: String, model: String, year: Int, color: UIColor) {
        self.color = UIColor.red
        super.init(make: make, model: model, year: year)
    }
}

class Truck: Vehicle {
    var cargoCapacity: Int
    
    init(make: String, model: String, year: Int, cargoCapacity: Int) {
        self.cargoCapacity = cargoCapacity
        super.init(make: make, model: model, year: year)
    }
}

let car = Car(make: "Maruti", model: "swift", year: 2020, color: .blue)
car.startEngine()
car.accelerate()
car.stopEngine()

let truck = Truck(make: "Ford", model: "Classic", year: 2015, cargoCapacity: 500)
truck.startEngine()
truck.accelerate()


