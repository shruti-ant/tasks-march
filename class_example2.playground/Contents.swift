import UIKit
import Foundation

/*
 Restaurant Management System:
 Implement classes for menu items, orders, and tables. Include functionalities for placing orders, adding/removing items from orders, and calculating the total bill.
 */

class MenuItem {
    let name: String
    let price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class OrderItem {
    let menuItem: MenuItem
    var quantity: Int
    
    init(menuItem: MenuItem, quantity: Int) {
        self.menuItem = menuItem
        self.quantity = quantity
    }
}

class Order {
    var items: [OrderItem] = []
    
    func addItem(menuItem: MenuItem, quantity: Int) {
        //let existingItem = items.first { $0.menuItem.name == menuItem.name }
        let result = checkItemExists(menuItem: menuItem)
        if result.1 != nil {
            result.1?.quantity += quantity
        } else {
            let orderItem = OrderItem(menuItem: menuItem, quantity: quantity)
            items.append(orderItem)
        }
    }
    
    private func checkItemExists(menuItem: MenuItem) -> (Int, OrderItem?) {
        var index = 0
        for item in items {
            if item.menuItem.name == menuItem.name {
                return (index, item)
            }
            index += 1
        }
        
        return (-1, nil)
    }
    
    func removeItem(menuItem: MenuItem, quantity: Int) {
        
        let result = checkItemExists(menuItem: menuItem)
        if result.0 != -1 {
            let index = result.0
            items[index].quantity -= quantity
            if items[index].quantity <= 0 {
                items.remove(at: index)
            }
        }
        
        
    }
    
    func calculateTotalBill() -> Double {
        var total: Double = 0
        for orderItem in items {
            total += orderItem.menuItem.price * Double(orderItem.quantity)
        }
        
        return total
    }
    
    
}

class Table {
    var order: Order?
    
    func placeOrder(order: Order) {
        self.order = order
        print("Order placed for table.")
    }
    
    func clearOrder() {
        order = nil
        print("Order cleared for table.")
    }
}


let menuItem1 = MenuItem(name: "Pizza", price: 150.4)
let menuItem2 = MenuItem(name: "Pasta", price: 100.5)

let order = Order()
order.addItem(menuItem: menuItem1, quantity: 2)
order.addItem(menuItem: menuItem2, quantity: 1)

let table = Table()
table.placeOrder(order: order)

print("Total bill: Rs.\(order.calculateTotalBill())")

table.order?.removeItem(menuItem: menuItem1, quantity: 1)
print("Total bill after removing items: Rs.\(order.calculateTotalBill())")

table.clearOrder()

