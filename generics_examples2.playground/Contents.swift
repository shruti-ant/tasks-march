import UIKit


/*
 Design and implement linked lists in Swift using generics. Ensure that it can handle different types of data while maintaining type safety.
 */

class Node<T: Equatable> {
    var value: T
    var next: Node?

    init(value: T) {
        self.value = value
    }
}


class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    // Insert a value at the end of the linked list
    func insert(value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }
    
    // Delete a node with a given value from the linked list
    func delete(value: T) {
        if head?.value == value {
            head = head?.next
        } else {
            var prev: Node<T>? = nil
            var current = head
            while current != nil && current?.value != value {
                prev = current
                current = current?.next
            }
            prev?.next = current?.next
        }
    }
    
    // Search for a value in the linked list
    func search(value: T) -> Bool {
        var current = head
        while current != nil {
            if current?.value == value {
                return true
            }
            current = current?.next
        }
        return false
    }
    
    // Print the elements of the linked list
    func printList() {
        var current = head
        while current != nil {
            print("\(current!.value) -> ", terminator: "")
            current = current?.next
        }
        print("nil")
    }
}

let myList = LinkedList<Int>()
myList.insert(value: 5)
myList.insert(value: 10)
myList.insert(value: 15)

myList.printList() // Output: 5 -> 10 -> 15 -> nil

print(myList.search(value: 10)) // Output: true
print(myList.search(value: 21)) // Output: false

myList.delete(value: 10)
myList.printList() // Output: 5 -> 15 -> nil

