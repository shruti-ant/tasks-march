import UIKit


/*
 In Swift, you can define error types using enums, structs, or classes depending on your specific requirements. Each approach has its own advantages and use cases. Let's explore how you can define error types using each method along with real-life examples.
 */
// Can use enums, structs, classes to definte error types


//Enum type
enum NetworkError: Error {
    case noInternetConnection
    case serverUnavailable
    case requestTimeout
    case resourceNotFound
}
/*
 Real-life example: Suppose you're developing a weather app that relies on fetching data from an external API. You can use an enum to represent various network-related errors that might occur during data retrieval, such as no internet connection, server unavailable, request timeout, or resource not found.
 */


//Using structs
/*
 They are suitable for error types that require additional associated data along with the error case.
 Real-life example: Imagine you're building a file management system. You may encounter errors like file not found, permission denied, or disk full. Using a struct allows you to provide detailed information about the error, such as the name of the file, error code, and error message.
 */

struct FileError: Error {
    let fileName: String
    let errorCode: Int
    let errorMessage: String
}


//Using classes
/*
 Classes are reference types in Swift, and they allow for inheritance and dynamic dispatch. They are suitable for defining error types that require complex behavior or mutable state.
 
 Real-life example: In a database-driven application, you might encounter errors such as database connection failure, SQL syntax errors, or deadlock situations. Using a class allows you to define custom methods like logError() to handle the error in a specific way.
 */

class DatabaseError: Error {
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    func logError() {
        print("Database error occurred: \(message)")
    }
}

/*
 Conclusion:
 The choice between using enums, structs, or classes for defining error types depends on the complexity and requirements of your application. Enums are simple and concise for representing a fixed set of error cases. Structs provide flexibility for including associated data with error cases. Classes offer additional capabilities like inheritance and methods for handling errors with more complex behavior.
 */

//Source - chatgpt 3.5

