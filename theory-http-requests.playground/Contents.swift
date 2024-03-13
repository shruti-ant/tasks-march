import UIKit


/*
 GET
 The most commonly used HTTP method is GET.

 The purpose of the GET method is to simply retrieve data from the server. The GET method is used to request any of the following resources:

 A webpage or HTML file.
 An image or video.
 A JSON document.
 A CSS file or JavaScript file.
 An XML file.
 The GET request method is said to be a safe operation, which means it should not change the state of any resource on the server.
 */


/*
 POST
 The POST HTTP request method sends data to the server for processing.

 The data sent to the server is typically in the following form:

 Input fields from online forms.
 XML or JSON data.
 Text data from query parameters.
 The HTTP specification enables the developer to decide the type of processing for the data sent through an HTTP POST method. Prototypical uses of the POST method include the following:

 Post a message to a bulletin board.
 Save data from HTML forms to a database.
 Calculate a result based on data submitted.
 A POST operation is not considered a safe operation, as it has the power to update the state of the server and cause potential side effects to the server’s state when executed.

 The HTTP POST method is not required to be idempotent either, which means it can leave data and resources on the server in a different state each time it is invoked.
 */


/*
 HEAD
 The HTTP HEAD method simply returns metadata about a resource on the server. This HTTP request method returns all of the headers associated with a resource at a given URL, but does not actually return the resource.

 The HTTP HEAD method is commonly used to check the following conditions:

 The size of a resource on the server.
 If a resource exists on the server or not.
 The last-modified date of a resource.
 Validity of a cached resource on the server.
 
 */


/*
 PUT
 The HTTP PUT method is used to completely replace a resource identified with a given URL.

 The HTTP PUT request method includes two rules:

 A PUT operation always includes a payload that describes a completely new resource definition to be saved by the server.
 The PUT operation uses the exact URL of the target resource.
 If a resource exists at the URL provided by a PUT operation, the resource’s representation is completely replaced. If a resource does not exist at that URL, a new resource is created.

 The payload of a PUT operation can be anything that the server understands, although JSON and XML are the most common data exchange formats for RESTful webservices and microservices.

 Idempotent and safe
 PUT operations are said to be unsafe but idempotent.

 They are not safe because they change the state of a resource on the server.
 They are idempotent because multiple invocations leave the server in the same state.
 For example, if a PUT operation sets the status of a flight to ontime, that operation could be invoked 100 times and the status would always end up being ontime. That’s the idea behind idempotence.
 */



/*
 DELETE
 The HTTP DELETE method is self-explanatory. After execution, the resource a DELETE operation points to is removed from the server.

 As with PUT operations, the HTTP DELETE method is idempotent and unsafe.
 */


/*
 Source: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/HTTP-methods
 */

