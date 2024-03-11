import UIKit
import Foundation

/*
 Design and implement queues in Swift using generics. Ensure that it can handle different types of data while maintaining type safety.
 */

struct Queue<T> {
    private var elements = [T]()
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeFirst()
        }
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    func size() -> Int {
        return elements.count
    }
}


var intQueue = Queue<Int>()
intQueue.enqueue(1)
intQueue.enqueue(2)
intQueue.enqueue(3)

print(intQueue.dequeue()) // Output: 1
print(intQueue.peek())    // Output: 2
print(intQueue.size())    // Output: 2

var stringQueue = Queue<String>()
stringQueue.enqueue("Hello")
stringQueue.enqueue("World")

print(stringQueue.dequeue()) // Output: Hello
print(stringQueue.peek())    // Output: World
print(stringQueue.size())    // Output: 1

