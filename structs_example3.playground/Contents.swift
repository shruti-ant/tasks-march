import UIKit
import Foundation


/*
 Design a struct to represent a complex data model for a banking system. Include properties for account holder name, account number, balance, and transaction history. Implement methods for deposit, withdrawal, and transferring funds, ensuring that the struct enforces validation rules such as minimum balance requirements and transaction limits.
 */


struct BankAccount {
    let accountHolderName: String
    let accountNumber: String
    private var balance: Double
    private var transactionHistory: [String]

    let minimumBalance: Double = 100
    let transactionLimit: Double = 1000

    init(accountHolderName: String, accountNumber: String, initialBalance: Double) {
        self.accountHolderName = accountHolderName
        self.accountNumber = accountNumber
        self.balance = initialBalance
        self.transactionHistory = ["Initial balance: \(initialBalance)"]
    }

    mutating func deposit(amount: Double) {
        balance += amount
        transactionHistory.append("Deposit: \(amount)")
    }

    mutating func withdraw(amount: Double) -> Bool {
        guard amount <= balance - minimumBalance else {
            print("Withdrawal amount exceeds available balance")
            return false
        }
        guard amount <= transactionLimit else {
            print("Withdrawal amount exceeds transaction limit")
            return false
        }
        balance -= amount
        transactionHistory.append("Withdrawal: \(amount)")
        return true
    }

    mutating func transfer(amount: Double, to account: inout BankAccount) -> Bool {
        guard amount <= balance - minimumBalance else {
            print("Insufficient balance for transfer")
            return false
        }  
        guard amount <= transactionLimit else {
            print("Transfer amount exceeds transaction limit")
            return false
        }
        balance -= amount
        account.deposit(amount: amount)
        transactionHistory.append("Transfer: \(amount) to \(account.accountNumber)")
        return true
    }

    func printTransactionHistory() {
        print("Transaction History for Account \(accountNumber):")
        for transaction in transactionHistory {
            print(transaction)
        }
        print("\n")
    }
}

var account1 = BankAccount(accountHolderName: "Alice", accountNumber: "123456789", initialBalance: 1000.0)
var account2 = BankAccount(accountHolderName: "Bob", accountNumber: "987654321", initialBalance: 500.0)

account1.deposit(amount: 200.0)
account1.withdraw(amount: 50.0)

account1.transfer(amount: 300.0, to: &account2)

account1.printTransactionHistory()
account2.printTransactionHistory()


