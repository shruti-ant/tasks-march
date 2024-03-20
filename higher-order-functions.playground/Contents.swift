import Foundation


/*
 Source - https://www.appcoda.com/higher-order-functions-swift/#Get_Prepared_to_work_with_Higher_Order_Functions_in_Swift
 */


// *** Map ***
// https://developer.apple.com/documentation/swift/array/map(_:)-87c4d

let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

var doubled = [Int]()
doubled = numbers.map({ n in
    return n * 2
})

print(doubled)

let squared = numbers.map {
    return $0 * $0
}

print(squared)

let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let lowerc = cast.map { text in
    return text.lowercased()
}
print(lowerc)
let letterCount = cast.map { text in
    return text.count
}
print(letterCount)

//using map with dictionaries

//ex - use map on dict to convert keys to uppercased strings, and to capitalize the first letter of each value.

var info = [String: String]()
info["name"] = "andrew"
info["city"] = "berlin"
info["job"] = "developer"
info["hobby"] = "computer games"

var newInfo = info.map { tuple in
    return (tuple.key.uppercased(), tuple.value.capitalized)
}
print(newInfo)
let newDict = Dictionary(uniqueKeysWithValues: newInfo)
print(newDict)


// *** MapValues ***
// we use this to get a dictionary that keeps the original keys and modified values

let updatedInfo = info.mapValues { val in
    return val.capitalized
}
print(updatedInfo)


// Usage of map function where element in collection is custom type

class Tester {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let testers = [Tester(name: "John", age: 23), Tester(name: "Lucy", age: 25), Tester(name: "Tom", age: 32), Tester(name: "Mike", age: 29), Tester(name: "Hellen", age: 19), Tester(name: "Jim", age: 35)]

let ages = testers.map { tester in
    return tester.age
}
print(ages)



print ("\n ******* \n")
// *** CompactMap ***
/*
 compactMap function is similar to map, except that the resulting array does not contain any nil values.
 */

let numbersWithNil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]

var doubledWithoutNil = [Int]()

doubledWithoutNil = numbersWithNil.compactMap { num in
    if let num = num {
        return num*2
    } else {
        return nil
    }
}
print(doubledWithoutNil)


// *** FlatMap ***
/*
 Returns an array containing the concatenated results of calling the given transformation with each element of this sequence.
 
 flatMap is useful when there are collections inside collections, and we want to merge them into one single collection.
 In fact, s.flatMap(transform) is equivalent to Array(s.map(transform).joined()).
 */
// https://developer.apple.com/documentation/swift/string/flatmap(_:)-i3m9

let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]

let allMarks = marks.flatMap { arr in
    return arr
}
print(allMarks)




print ("\n ******* \n")
// *** Filter ***
/*
 filter the elements of a collection based on a condition and produce a new one containing only those elements that satisfy the condition.
 */

let numbers2 = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

let numsGreaterTen = numbers2.filter { n in
    return n > 10
}
print(numsGreaterTen)



print ("\n ******* \n")
// *** Reduce ***
/*
 It produces one value from the values of all elements in a collection.
 Arguments in closure of reduce function: the first argument always represents the partial result & not an element in the collection. the second argument represents the element in the collection.
 $0 is the partial result , while $1 is an element in the array.
 */

let numbers3 = [5, 3, 8, 4, 2]

let product = numbers3.reduce(1) { partialResult, num in
    return partialResult * num
}
print(product)


//using reduce with dictionaries

let friendsAndMoney = ["Alex": 150.00, "Tim": 62.50, "Alice": 79.80, "Jane": 102.00, "Bob": 94.20]

let totalMoney = friendsAndMoney.reduce(0) { partialResult, element in
    return partialResult + element.value
}
print(totalMoney)




print ("\n ******* \n")
// *** ForEach ***

let numbers4 = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

numbers4.forEach { n in
    n % 2 == 0 ? print("\(n) is even") : print("\(n) is odd")
}



print ("\n ******* \n")
// *** Contains ***
/*
 contains function is used in collections in order to check if there are elements that satisfy a certain condition and it returns a boolean value.
 This function does not return a new collection, but a single Boolean value which is true when the given condition is satisfied, and false when not.
 */

var containsLessThanFive = false
containsLessThanFive = numbers4.contains { n in
    return n < 5
}
print(containsLessThanFive)


//using contains on custom types
class Staff {
    enum Gender {
        case male, female
    }
    
    var name: String
    var gender: Gender
    var age: Int
    
    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }
}

let staff = [Staff(name: "Nick", gender: .male, age: 37), Staff(name: "Julia", gender: .female, age: 29), Staff(name: "Tom", gender: .male, age: 41), Staff(name: "Tony", gender: .male, age: 45), Staff(name: "Emily", gender: .female, age: 42), Staff(name: "Irene", gender: .female, age: 30)]

let hasStaffOver40 = staff.contains { s in
    return s.age > 40
}
print(hasStaffOver40)

let hasMalesOver40 = staff.contains { s in
    return s.gender == .male && s.age > 40
}
print(hasMalesOver40)

let hasMalesUnder30 = staff.contains { s in
    return s.gender == .male && s.age < 30
}
print(hasMalesUnder30)


//using contains with dict
let temperatures = ["London": 7, "Athens": 14, "New York": 15, "Cairo": 19, "Sydney": 28]

let anyCitiesOver25 = temperatures.contains { element in
    return element.value > 25
}
print(anyCitiesOver25)




print ("\n ******* \n")
// *** RemoveAll ***
/*
 to remove collection elements based on condition. it modifies original array.
 removeAll function is available in arrays only, not in dictionaries or sets.
 */

var numbers5 = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
numbers5.removeAll() { n in
    return n < 10
}
print(numbers5)




print ("\n ******* \n")
// *** Sorted ***
/*
 Sorting a collection’s data in ascending order is done using the sorted() by default.
 when sorting order must be specified (ascending or descending), or sorting should be based on a specific condition, then this is where sorted higher order function gets into play.
 
 Sorting is possible in dictionaries too. However the resulting collection is not a dictionary; it’s an array of tuples, where the first value on each tuple is the key and the second is the value.

 Sorting is possible in dictionaries too. However the resulting collection is not a dictionary; it’s an array of tuples, where the first value on each tuple is the key and the second is the value.

 */

let toSort = [5, 3, 8, 2, 10]
let sortedArr = toSort.sorted()
print (sortedArr)

let descSort = toSort.sorted() {n1, n2 in
    return n1 > n2
}
print(descSort)

//sorting temperatures dictionary
let descTempSort = temperatures.sorted() { t1, t2 in
    return t1.value > t2.value
}
print(descTempSort)


