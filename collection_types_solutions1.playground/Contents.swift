import UIKit
import Foundation

/*
 Arrays
 basics functional programming funcs with swift arrays
 */

//Given an array of integers, filter out the odd numbers.
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let filteredNumbers = numbers.filter { $0 % 2 == 0 }
print(filteredNumbers)


//Given an array of integers, create an array of string representations of these integers.
numbers = [1, 2, 3, 4, 5]
let stringRepresentations = numbers.map { String($0) }
print(stringRepresentations)



//Given an array of integers, find the sum of squares of all even numbers.
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let sum = numbers.map{ $0 * $0}.reduce(0, +)
print(sum)



/*
 Sets
 • Write a function to find the intersection of two sets of integers.
 • Implement a function to remove all duplicate elements from a set.
 • Create a function that checks if one set is a subset of another.
 • Write a function to find the union of multiple sets.
 • Implement a function that returns the symmetric difference of two sets.
 */

func intersection(_ set1: Set<Int>, _ set2: Set<Int>) -> Set<Int> {
    return set1.intersection(set2)
}

func removeDuplicates(_ set: Set<Int>) -> Set<Int> {
    return Set(set)
}

func isSubset<T: Hashable>(_ set1: Set<T>, _ set2: Set<T>) -> Bool {
    return set1.isSubset(of: set2)
}

func unionOfSets(_ sets: Set<Int>...) -> Set<Int> {
    var result: Set<Int> = []
    for set in sets {
        result.formUnion(set)
    }
    return result
}

func symmetricDifference(_ set1: Set<Int>, _ set2: Set<Int>) -> Set<Int> {
    return set1.symmetricDifference(set2)
}

