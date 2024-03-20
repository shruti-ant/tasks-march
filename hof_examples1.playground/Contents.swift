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
