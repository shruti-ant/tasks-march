import UIKit
import Foundation

// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/#Extensions-with-a-Generic-Where-Clause

func swapTwoValues<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = "fire"; var y = "water"
swapTwoValues(a: &x, b: &y)
print("\(x) and \(y)")


//Writing a simple generic stack
struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// the stack now contains 4 strings

let fromTheTop = stackOfStrings.pop() //cuatro


extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

print(stackOfStrings.topItem)



// Type constrains
func findIndex<T: Equatable>(val: T, arr:[T]) -> Int? {
    
    for (index, value) in arr.enumerated() {
        if value == val {
            return index
        }
    }
    
    return nil
}

let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"]) //result is 2


// ** Associated types **
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

// A concrete type specified for struct conforming to container protocol
struct IntStack: Container {
    var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    // conformance to the Container protocol
    typealias Item = Int

    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

// A generic type specified for struct conforming to container protocol
struct Stack2<Element>: Container {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}



