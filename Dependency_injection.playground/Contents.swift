import UIKit

/*
 There are 2 types of dependency injection in Swift.
 Listing example below of each
 */

protocol Serializer {

    func serialize(data: AnyObject) -> NSData?
}

class RequestSerializer: Serializer {
    
    func serialize(data: AnyObject) -> NSData? {
        return nil
    }
}

// 1) Initializer Injection

class DataManager {
    private let serializer: Serializer //immutable
    
    init(serializer: Serializer) {
        self.serializer = serializer
    }
}

let serializer = RequestSerializer()
let dataManager = DataManager(serializer: serializer) //injecting dependency of serializer class into object property of DataManager instance, through initilizer, the dependency is immutable here


// 2) Property Injection

class VC: UIViewController {
    var requestManager: RequestSerializer?
}

let vc = VC()
vc.requestManager = serializer //injecting dependency of serializer class into object property of UIViewController instance, through setting property, the dependency is mutable here


// 3) Method Injection

class Request {}

class DataManager2 {

    func serializeRequest(request: Request, with serializer: Serializer) -> NSData? {
        return nil
    }
}

let dataManager2 = DataManager2()
dataManager2.serializeRequest(request: Request(), with: serializer) //injecting dependency of serializer class into object method of UIViewController instance, through passing as argument, the dependency not owned by class in this case


