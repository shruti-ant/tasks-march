import UIKit
import Foundation


/*
 Remote API Requests: Develop a program that asynchronously sends multiple HTTP requests to a remote API using Swift's Task API, processing the responses concurrently to perform tasks such as data retrieval.
 */


func sendRequest(url: URL) async throws -> (Data?, URLResponse?, Error?) {
    let (data, response) = try await URLSession.shared.data(from: url)
    return (data, response, nil)
}

let urls = [
    URL(string: "https://api.example.com/data1")!,
    URL(string: "https://api.example.com/data2")!,
    URL(string: "https://api.example.com/data3")!
]

//  function to send multiple HTTP requests concurrently
func main() async {
    // array to store results
    var results = [(Data?, URLResponse?, Error?)]()

    // Send requests concurrently using async/await
    for url in urls {
        do {
            let result = try await sendRequest(url: url)
            results.append(result)
        } catch {
            print("Error sending request to \(url): \(error)")
        }
    }

    for (index, result) in results.enumerated() {
        let (data, response, error) = result
        if let data = data {
            print("Request \(index + 1) succeeded. Response data: \(String(data: data, encoding: .utf8) ?? "")")
        } else if let error = error {
            print("Request \(index + 1) failed with error: \(error)")
        } else {
            print("Request \(index + 1) failed with unknown error.")
        }
    }
}


Task {
    await main()
}

