import UIKit
import Foundation


/*
 User Authentication Error Handling: Develop a user authentication system for an app where users can sign up, log in, and reset their passwords. Implement error handling for scenarios such as invalid credentials, account locked, network errors during authentication, etc.
 source - question prompt from chat gpt
 */


enum AuthenticationError: Error {
    case invalidCredentials
    case accountLocked
    case networkError
    case unknownError
}

struct User {
    let username: String
    var password: String
}

class AuthManager {
    var users: [String: User] = [:]

    func signUp(username: String, password: String) {
        // Assuming username should be unique
        guard users[username] == nil else {
            print("Username already exists.")
            return
        }

        let newUser = User(username: username, password: password)
        users[username] = newUser
        print("User \(username) signed up successfully.")
    }

    func login(username: String, password: String) throws {
        guard let user = users[username] else {
            throw AuthenticationError.invalidCredentials
        }

        if user.password != password {
            throw AuthenticationError.invalidCredentials
        }

        print("User \(username) logged in successfully.")
    }

    func resetPassword(username: String, newPassword: String) {
        guard var user = users[username] else {
            print("User not found.")
            return
        }

        user.password = newPassword
        users[username] = user
        print("Password for user \(username) reset successfully.")
    }
}

// Example Usage
let authManager = AuthManager()

// Sign up
authManager.signUp(username: "user1", password: "password1")

// Login
do {
    try authManager.login(username: "user1", password: "password1")
} catch let error as AuthenticationError {
    switch error {
    case .invalidCredentials:
        print("Invalid username or password.")
    case .accountLocked:
        print("Account is locked. Please contact support.")
    case .networkError:
        print("Network error occurred.")
    case .unknownError:
        print("An unknown error occurred.")
    }
} catch {
    print("An unknown error occurred.")
}

// Reset password
authManager.resetPassword(username: "user1", newPassword: "newpassword")

// Attempt login with old password
do {
    try authManager.login(username: "user1", password: "password1")
} catch let error as AuthenticationError {
    switch error {
    case .invalidCredentials:
        print("Invalid username or password.")
    case .accountLocked:
        print("Account is locked. Please contact support.")
    case .networkError:
        print("Network error occurred.")
    case .unknownError:
        print("An unknown error occurred.")
    }
} catch {
    print("An unknown error occurred.")
}

