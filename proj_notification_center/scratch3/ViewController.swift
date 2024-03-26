//
//  ViewController.swift
//  scratch3


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleDataNotification(_:)), name: .dataNotification, object: nil)
        
        // Usage
        let dataProducer = DataProducer()

        dataProducer.produceData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleDataNotification(_ notification: Notification) {
        if let data = notification.userInfo?["message"] as? String {
            print("Received data: \(data)")
        }
    }

}

extension Notification.Name {
    static let dataNotification = Notification.Name("DataNotification")
}

class DataProducer {
    func produceData() {
        let data: [String: Any] = ["message": "Hello, world!"]
        NotificationCenter.default.post(name: .dataNotification, object: nil, userInfo: data)
    }
}
