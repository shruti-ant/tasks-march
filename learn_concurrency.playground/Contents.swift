import UIKit
import Foundation

/*
Sources -
 https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/#Defining-and-Calling-Asynchronous-Functions
 
 chatgpt
 */

// ** Example1: simple concurrent code in swift **

// Asynchronous function simulating a network request
func fetchData() async -> String {
    // Simulate asynchronous delay (e.g., fetching data from a server)
    await Task.sleep(1_000_000_000) // 1 second delay
    
    // Simulated data
    return "Data received from server"
}

// Example async function that makes use of `await`
func processData() async {
    print("Processing data...")
    
    // Perform asynchronous operation and await its result
    let result = await fetchData()
    
    // Once data is fetched, print the result
    print("Received data:", result)
    
    // Continue with other operations
    print("Data processing complete.")
}

// Run the async function
print("Starting ")
Task {
    await processData()
    print("lets see when printed")
    
}
print("last")



// ** Example2: example of async property in swift **
//basically a property that holds return value from async function, is unofficially called async property

// Asynchronous function that returns a String after a delay
func fetchUserData() async -> String {
    // Simulate asynchronous delay (e.g., fetching data from a server)
    await Task.sleep(1_000_000_000) // 1 second delay
    
    return "John Doe"
}

// Example struct representing a user
struct User {
    let name: String
}

// Asynchronous function that creates a User instance
func createUser() async -> User {
    let name = await fetchUserData() // Fetch user data asynchronously
    return User(name: name)
}

// Run the async function to create a User instance
Task {
    let user = await createUser()
    print("User: \(user.name)")
}



// Run the async function to create a User instance
Task {
    let user = await createUser()
    print("User: \(user.name)")

    // Assigning the async value to a property
    let asyncUser: User = user
    print("Async user: \(asyncUser.name)")
}


// ** Example 3 ** : Calling Asynchronous Functions in Parallel

// Here, each photo downloads completely before the next one starts downloading.
/*
 let firstPhoto = await downloadPhoto(named: photoNames[0])
 let secondPhoto = await downloadPhoto(named: photoNames[1])
 let thirdPhoto = await downloadPhoto(named: photoNames[2])


 let photos = [firstPhoto, secondPhoto, thirdPhoto]
 show(photos)
 */


//Here, all three calls to downloadPhoto(named:) start without waiting for the previous one to complete.
/*
 async let firstPhoto = downloadPhoto(named: photoNames[0])
 async let secondPhoto = downloadPhoto(named: photoNames[1])
 async let thirdPhoto = downloadPhoto(named: photoNames[2])

 //below, 'photos' variable needs the results from asynchronous calls, so we write 'await' to pause execution until all three photos finish downloading
 let photos = await [firstPhoto, secondPhoto, thirdPhoto]
 show(photos)
 */


