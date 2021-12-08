//: [Previous](@previous)
import Foundation
import Combine

/*:
# Subjects
- A subject is a publisher ...
- ... relays values it receives from other publishers ...
- ... can be manually fed with new values
- ... subjects as also subscribers, and can be used with `subscribe(_:)`
*/

/*:
## Example 1
Using a subject to relay values to subscribers
*/
let relay = PassthroughSubject<String, Never>()

let subscription = relay // relay subscriber
	.sink { value in
		print("subscription1 received value: \(value)")
}

relay.send("Hello") // relay publisher
relay.send("World!")

// so this acts the same as a regular Publishers.Sequence<[String], Never>
let hw_sub : Publishers.Sequence<[String], Never> = ["hello","world"].publisher // array publisher

hw_sub.sink {value in                    // hw sub
    print("sub1 = \(value)")
}

//: What happens if you send "hello" before setting up the subscription?
//: Nothing.  This is cold stream.

/*:
## Example 2
Subscribing a subject to a publisher
*/

let publisher = ["Here","we","go!"].publisher
// it just passes through [pub] ->(sub) -> [pass] -> (pub) -> sub
publisher.subscribe(relay)

/*:
## Example 3
Using a `CurrentValueSubject` to hold and relay the latest value to new subscribers
*/

// Hot Stream we see sub 2
let variable = CurrentValueSubject<String, Never>("")

print("~~~~~ Start cold stream showing only the last value ~~~~~")
for index in 1...100 {
    variable.send("Initial text \(index)")
}

let subscriptionCurrentVal = variable.sink { value in
    print("subscriptionCurrentVal received value: \(value)")
}

variable.send("More text")

/*
 // Cold Stream do not see the sub 3
 let pv = PassthroughSubject<String, Never>()
 print("~~~~~ Start cold stream showing only the last value ~~~~~")
 let subscription3 = pv.sink { value in
     print("subscription3 received value: \(value)")
 }
 for index in 1...100 {
     pv.send("Initial text \(index)")
 }
 */

//: [Next](@next)
