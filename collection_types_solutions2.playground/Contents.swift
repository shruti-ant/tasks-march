import UIKit

/*
 1. Write a function that takes a dictionary of strings to integers and returns the key with the highest value.
 2. Implement a function to merge two dictionaries. If there are overlapping keys, prefer the value from the first dictionary.
 3. Create a function that counts the frequency of each word in a given string and returns a dictionary mapping each word to its count.
 4. Write a function to remove all entries in a dictionary with a value of zero.
 5. Implement a function that checks if two dictionaries have the same keys and values.
 */

//1
func keyWithHighestValue(_ dictionary: [String: Int]) -> String? {
    guard !dictionary.isEmpty else {
        return nil
    }
    
    var highestValueKey: String?
    var highestValue: Int = Int.min
    
    for (key, value) in dictionary {
        if value > highestValue {
            highestValue = value
            highestValueKey = key
        }
    }
    
    return highestValueKey
}

let dict1 = ["apple": 10, "banana": 5, "orange": 15]
if let key = keyWithHighestValue(dict1) {
    print("Key with the highest value: \(key)")
} else {
    print("Dictionary is empty")
}


//2
func mergeDictionaries(_ dict1: [String: Int], _ dict2: [String: Int]) -> [String: Int] {
    var mergedDictionary = dict1
    for (key, value) in dict2 {
        mergedDictionary[key] = value
    }
    return mergedDictionary
}

let dictionary1 = ["apple": 10, "banana": 5]
let dictionary2 = ["orange": 15, "grape": 8]
let mergedDict = mergeDictionaries(dictionary1, dictionary2)
print("Merged Dictionary: \(mergedDict)")



//3
func wordFrequency(_ text: String) -> [String: Int] {
    var frequencyDict = [String: Int]()
    let words = text.split(separator: " ")
    
    for word in words {
        let wordStr = String(word)
        if !wordStr.isEmpty {
            frequencyDict[wordStr, default: 0] += 1
        }
    }
    
    return frequencyDict
}

let res1 = wordFrequency("apple apple cat dog dog dog monkey")
print(res1)


//4
func removeZeroValueEntries(_ dictionary: inout [String: Int]) {
    var keysToRemove = [String]()
    for (key, value) in dictionary {
        if value == 0 {
            keysToRemove.append(key)
        }
    }
    for key in keysToRemove {
        dictionary.removeValue(forKey: key)
    }
}

var dictionary: [String: Int] = ["apple": 10, "banana": 0, "orange": 15, "grape": 0]
removeZeroValueEntries(&dictionary)
print("Dictionary after removing zero value entries: \(dictionary)")


//5
func areDictionariesEqual(_ dict1: [String: Int], _ dict2: [String: Int]) -> Bool {
    guard dict1.keys.count == dict2.keys.count else {
        return false
    }
    for (key, value) in dict1 {
        if let valueInDict2 = dict2[key], value == valueInDict2 {
            continue
        } else {
            return false
        }
    }
    return true
}


