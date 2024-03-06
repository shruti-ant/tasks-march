import UIKit
import Foundation

/*
 Geometry Shapes:
 Create structs to represent various geometric shapes like circles, triangles, and squares. Include methods to calculate their areas and perimeters.
 */

struct Circle {
    var radius: Double
    
    func calculateArea() -> Double {
        return Double.pi * pow(radius, 2)
    }
    
    func calculatePerimeter() -> Double {
        return 2 * Double.pi * radius
    }
}


struct Triangle {
    var side1: Double
    var side2: Double
    var side3: Double
    
    func calculateArea() -> Double {
        let s = (side1 + side2 + side3) / 2
        return sqrt(s * (s - side1) * (s - side2) * (s - side3))
    }
    
    func calculatePerimeter() -> Double {
        return side1 + side2 + side3
    }
}

struct Square {
    var side: Double
    
    func calculateArea() -> Double {
        return pow(side, 2)
    }
    
    func calculatePerimeter() -> Double {
        return 4 * side
    }
}

let circle = Circle(radius: 5)
print("Circle Area:", circle.calculateArea())
print("Circle Perimeter:", circle.calculatePerimeter())

let triangle = Triangle(side1: 3, side2: 4, side3: 5)
print("Triangle Area:", triangle.calculateArea())
print("Triangle Perimeter:", triangle.calculatePerimeter())

let square = Square(side: 6)
print("Square Area:", square.calculateArea())
print("Square Perimeter:", square.calculatePerimeter())

