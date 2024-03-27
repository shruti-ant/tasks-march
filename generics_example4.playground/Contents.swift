import UIKit


/*
 Create linear & binary search algorithms that can operate on various types of data in Swift.
*/


//Linear search algo

func linearSearch<T: Equatable> (_ arr: [T] ,_ val: T) -> Int? {
    for (index, value) in arr.enumerated() {
        if value == val {
            return index
        }
    }
    return nil
}

let intArray = [1, 2, 3, 4, 5]
let targetInt = 3
if let index = linearSearch(intArray, targetInt) {
    print("Linear Search: Element \(targetInt) found at index \(index)")
} else {
    print("Linear Search: Element \(targetInt) not found")
}

let stringArray = ["apple", "banana", "orange", "pear"]
let targetString = "orange"
if let index = linearSearch(stringArray, targetString) {
    print("Linear Search: Element \(targetString) found at index \(index)")
} else {
    print("Linear Search: Element \(targetString) not found")
}



// Binary search algo (need sorted array)
func binarySearch<T: Comparable>(_ array: [T], _ key: T) -> Int? {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = low + (high - low) / 2
        if array[mid] == key {
            return mid
        } else if array[mid] < key {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return nil
}


if let index = binarySearch(intArray, targetInt) {
    print("Binary Search: Element \(targetInt) found at index \(index)")
} else {
    print("Binary Search: Element \(targetInt) not found")
}


if let index = binarySearch(stringArray, targetString) {
    print("Binary Search: Element \(targetString) found at index \(index)")
} else {
    print("Binary Search: Element \(targetString) not found")
}

