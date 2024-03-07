import UIKit


//CaseIterable protocol - any enum without associated values can conform to this protocol, it provides you access to a collection of all of the type's cases.
//Example

enum CompassDirection: CaseIterable {
    case north, south, east, west
}

print("num of compass directions are \(CompassDirection.allCases.count)")

print("\nDirections are:")
for dir in CompassDirection.allCases {
    print(dir)
}


//Associated values in enum
/*
 Associated Values shows how cases of an enumeration can declare that they store associated values of different types.
 */
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var bcode1 = Barcode.upc(1, 2, 3, 4)
var bcode2 = Barcode.qrCode("abcdefg")

func printBarCode(bcode: Barcode) {
    switch bcode {
    case .upc(let num1, let num2, let num3, let num4):
        print("upc \(num1), \(num2), \(num3), \(num4)")
    case .qrCode(let str):
        print("qr code \(str)")
    }
}

printBarCode(bcode: bcode1)
printBarCode(bcode: bcode2)



//Raw values - where enum can store default values with each type
/*
 enumeration cases can come prepopulated with (fixed) default values (called raw values), which are all of the same type.
 */

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//implicit raw values, are possible for string and int types
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
print("earth's value is: \(Planet.earth.rawValue)")

enum Dir: String {
    case east, west, north, south
}
print("east direction's value is: \(Dir.east.rawValue)")

var planet = Planet.mercury
planet = Planet(rawValue: 7)!



