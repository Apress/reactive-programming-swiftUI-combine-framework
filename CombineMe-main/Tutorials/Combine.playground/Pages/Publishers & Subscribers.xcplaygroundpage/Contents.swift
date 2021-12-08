import Foundation
import Combine

/*:
 # Publishers and Subscribers
 - A Publisher _publishes_ values ...
 - .. a subscriber _subscribes_ to receive publisher's values

 __Specifics__:
 - Publishers are _typed_ to the data and error types they can emit
 - A publisher can emit, zero, one or more values and terminate gracefully or with an error of the type it declared.
 */

/*:
## Example 1
"publish" just one value then complete
 */
/**
 ## <Type><Error>
 <type = Int>, <Error = None>
 */
let publisherJust = Just(42)

// You need to _subscribe_ to receive values (here using a sink with a closure)
let subscription1 = publisherJust.sink { value in
	print("Received value from publisherJust: \(value)")
}

/*:
## Example 2
"publish" a series of values immediately
 */
//<Int> < Never>
let publisherSequ = [1,2,3,4,5].publisher

//<Int> <Never>
let subscriptionSequ = publisherSequ
    //.map{Int($0)}
    .sink {value in
        print("Received value from publisherSequ: \(value + 12)")
    }

//<Int> < Never>
let publisher_string = ["1", "2"].publisher

//<Int> <Never>
let subscriptionString = publisher_string
    .map{Int($0)} // remove this to get error int != String
    .sink {value in
        print("Received value from publisherString: \(value! + 12)")
    }

// On collection vs Publisher
let coolect = [1,2,3,4,5]
let col2 = coolect.map{$0 * 2 }
print(col2)

/*:
## Example 3
assign publisher values to a property on an object
 */
print("")
class MyClass {
	var property: Int = 0 {
		didSet {
			print("Did set property to \(property)")
		}
	}
}

let MyClassObj = MyClass()
let subscription4 = publisherSequ.assign(to: \.property, on: MyClassObj)

//: [Next](@next)
