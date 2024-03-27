import UIKit
import Foundation

class Pokemon: NSObject {
    @objc dynamic var name: String
    
    init(name: String) {
       self.name = name
    }
}

let myFirstPokemon = Pokemon(name: "Charmander")

//Inheriting from NSObject making class KVC compliant
let pokemonName = myFirstPokemon.value(forKey: "name")
myFirstPokemon.setValue("Charmeleon", forKey: "name")


//implementing kvo
myFirstPokemon.observe(\.name, options: [.old, .new]) { (pokemon, value) in
    print("old name \(value.oldValue!)")
    print("new name \(value.newValue!)")
}

myFirstPokemon.name = "Charizard"


// source - https://anuragajwani.medium.com/introduction-to-kvo-and-kvc-in-swift-dceadfcf1b28


