import UIKit
import Foundation



//Here we make a GET request
func example1 () {
    
    struct Berry: Decodable {
        let name: String
        let size: Int
    }
    
    // Api being used: https://pokeapi.co/docs/v2
    let url = URL(string: "https://pokeapi.co/api/v2/berry/1/")!
    
    var config = URLSessionConfiguration.default
    config.waitsForConnectivity = true
    let urlSession = URLSession(configuration: config)
    
    let task = urlSession.dataTask(with: url) { data, response, error in
        
        if let data = data {
            let berry: Berry? = try? JSONDecoder().decode(Berry.self, from: data)
            if let berry1 = berry {
                print("Name of the berry is \(berry1.name)")
            } else {
                print("error")
            }
        }
    }
    task.resume() //Output: Name of the berry is cheri
}

example1()


// **************

//Example POST request

func example2() {
    
    //Preparing body to be sent with POST req
    struct Body: Encodable {
        let title: String
        let body: String
        let userId: Int
    }
    
    let body = Body(title: "My New Post", body: "This is the body of my new post.", userId: 1)
    let bodyData = try! JSONEncoder().encode(body)
    
    //Now the actual req
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    request.httpBody = bodyData
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        let statusCode = (response as! HTTPURLResponse).statusCode
        
        print("status code for POST req is \(statusCode)")
    }
    task.resume()
    
}

example2() //Output: status code for POST req is 201
//source: https://cocoacasts.com/networking-fundamentals-how-to-make-a-post-request-in-swift



// **************

//Example PUT request

func example3() {
    
    //Preparing body to be sent with PUT req
    struct Body: Encodable {
        let title: String
        let body: String
        let userId: Int
        let id: Int
    }
    
    let body = Body(title: "foo", body: "bar", userId: 1, id: 1)
    let bodyData = try! JSONEncoder().encode(body)
    
    
    // Now request part
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.allHTTPHeaderFields = [
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
    
    URLSession.shared.uploadTask(with: request, from: bodyData) { (responseData, response, error) in
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        
        print("status code for PUT req is \(statusCode)")
    }.resume()
}

example3() //Output: status code for PUT req is Optional(200)

//source: https://www.simpleswiftguide.com/how-to-make-http-put-request-with-json-as-data-in-swift/


// **************

//Example DELETE request

func example4() {
    
    // Now request part
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        
        print("status code for DELETE req is \(statusCode)")
    }.resume()
    
}

example4() //Output: status code for DELETE req is Optional(200)

//source: https://johncodeos.com/how-to-make-post-get-update-and-delete-requests-with-urlsession-using-swift/


/*
 Full output:
 Name of the berry is cheri
 status code for DELETE req is Optional(200)
 status code for PUT req is Optional(200)
 status code for POST req is 201
 */

