//: [Previous](@previous)

import Foundation
import Combine
/*:
# Simple operators
- Operators are functions defined on publisher instances...
- ... each operator returns a new publisher ...
- ... operators can be chained to add processing steps
*/

/*:
## Example: `map`
- works like Swift's `map`
- ... operates on values over time
*/
let publisherPass = PassthroughSubject<Int, Never>()

// simple map
let publisherPassMap = publisherPass.map { value in
	value + 100
}

let subscriptionPass = publisherPass
    //.map { $0 + 100 } // same like a collection class
	.sink { value in
		print("SubscriptionPass received integer: \(value)")
}

let subscriptionPassMap = publisherPassMap
	.sink { value in
		print("SubscriptionPassMap received integer: \(value)")
}

print("* Demonstrating map operator")
print("PublisherPass emits 28")
publisherPass.send(28)

print("PublisherPass emits 50")
publisherPass.send(50)

subscriptionPass.cancel()
subscriptionPassMap.cancel()

/*:
## Example: `filter`
- works like Swift's `filter`
- ... operates on values over time
*/

let publisherPassEven = publisherPass.filter {
	// only let even values pass through
	($0 % 2) == 0
}

let subscriptionPassEven = publisherPassEven
    //.filter{ $0 < 15 }
	.sink { value in
		print("SubscriptionPassEven received integer: \(value)")
}

print("\n* Demonstrating filter operator")
print("PublisherPass emits 14")
publisherPass.send(14)

print("PublisherPass emits 15")
publisherPass.send(15)

print("PublisherPass emits 16")
publisherPass.send(16)

//: [Next](@next)
