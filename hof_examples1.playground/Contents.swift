import Foundation


/*
 You have an array of strings representing numbers. Convert these strings into integers and then filter out the even numbers. Finally, square each of the filtered numbers and return the result as an array of squared integers.
 */

let stringNumbers = ["1", "2", "3", "4", "5", "6"]

let squaredEvenNumbers = stringNumbers
    .compactMap { Int($0) } // Convert strings to integers, ignoring nils
    .filter { $0 % 2 == 0 } // Filter out even numbers
    .map { $0 * $0 } // Square each number

print(squaredEvenNumbers)

let res1 = stringNumbers.map { s in
    return Int(s)!
}.filter() { n in
    return n % 2 == 0
}.map() { n in
    return n*n
}
print(res1)




/*
 Problem: Filtering and Reducing Data

 You have an array of dictionaries representing products with their prices. Filter out the products with prices greater than $50 and then calculate the total price of the remaining products.

 */

let products = [
    ["name": "Product 1", "price": 30],
    ["name": "Product 2", "price": 60],
    ["name": "Product 3", "price": 45],
    ["name": "Product 4", "price": 80]
]

let res2 = products.filter() { el in
    return (el["price"] as! Int) > 50
}.reduce(0) { partialResult, el in
    return partialResult + (el["price"] as? Int ?? 0)
}
print(res2)


let totalPrice = products
    .filter { ($0["price"] as? Int ?? 0) > 50 } // Filter out products with price > $50
    .reduce(0) { $0 + ($1["price"] as? Int ?? 0) } // Sum up prices



/*
 You have an array of optional strings. You want to unwrap them and convert them into integers, filtering out any nil values, and then sum up all the resulting integers.
 */

let optionalStrings: [String?] = ["10", "20", nil, "30", "40", nil, "50"]

let res3 = optionalStrings.compactMap() { s in
    return s
}.map() { s in
    return Int(s)!
}.reduce(0) { partialResult, n in
    return partialResult + n
}
print(res3)

let sum = optionalStrings
    .compactMap { $0 } // Remove nils
    .compactMap { Int($0) } // Convert strings to integers, ignoring nils
    .reduce(0, +) // Sum up the integers


