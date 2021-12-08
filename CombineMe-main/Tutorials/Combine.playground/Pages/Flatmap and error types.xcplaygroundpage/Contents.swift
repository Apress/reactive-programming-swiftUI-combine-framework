//: [Previous](@previous)

import Foundation
import UIKit
import Combine

/*:
 [Previous](@previous)
 ## flatmap
 - with `flatmap` you provide a new publisher every time you get a value from the upstream publisher
 - ... values all get _flattened_ into a single stream of values
 - ... it looks like Swift's `flatMap` where you flatten inner arrays of an array, just asynchronous.
 
 ## matching error types
 - use `mapError` to map a failure into a different error type
 */

/*:### treat it like a data structure*/
let mydata = [1,2,3,4,5]
//compactMap - only publish them down to the subscriber if the result is not nil
let md = mydata.compactMap({$0 * 2})
print("compact map \(md)")
let num = mydata.reduce(0,{x,y in x + y})
print("reducer", num)

let myd = mydata.publisher
myd.reduce(0,{x,y in x + y}).sink( receiveValue: {data in print("pub reducer", data)})

print("\n")// output space in playground to separate the output

[1, 2, 3].publisher.flatMap({ int in
    // makes a bunch of publishers to be flattened
    return (0..<int).publisher.print("flat ->")
  }).sink(receiveCompletion: { id in print("name", id)}, receiveValue: { value in
    print("value: \(value)")
  })

// flatMap(maxPublishers:) will limit the number of publisher
// .switchToLatest() -- only take the latest publisher


//: define the error type we need
enum RequestError: Error {
    case sessionError(error: Error)
}

//: we will send URLs through this publisher to trigger requests
let URLPublisher = PassthroughSubject<URL, RequestError>()

//: use `flatMap` to turn a URL into **a requested data publisher**
let subscription = URLPublisher.flatMap { requestURL in
    URLSession.shared
        .dataTaskPublisher(for: requestURL)
        .mapError { error ->
            RequestError in RequestError.sessionError(error: error)
        }
}
//.print("flat url -> ")
.assertNoFailure()
.sink { result in
    print("Request completed!")
    _ = UIImage(data: result.data)
}

URLPublisher.send(URL(string: "https://httpbin.org/image/jpeg")!)
//: [Next](@next)
