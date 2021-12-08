//: [Previous](@previous)

import Foundation
import Combine


/*:
 From: https://www.vadimbulavin.com/understanding-schedulers-in-swift-combine-framework/
 
 Let’s summarize the key points to remember:

 * subscribe(on:) and receive(on:) are primary multithreading methods of Combine Swift framework.
 
 * The default scheduler uses the same thread from where the element was generated.
 
 * receive(on:) sets a scheduler for all operators coming afterwards.
  
 * subscribe(on:) sets a scheduler for the whole stream, starting at the time the Publisher is subscribed to. The stream stays on the same scheduler, until receive(on:) specifies another scheduler.
 
 * The position of subscribe(on:) does not matter.
 
 * Asynchronous work is typically performed by subscribing on the background scheduler and receiving values on the UI scheduler.
 
 
 */


/*:
# Scheduling operators - Dispatch to various threads
- Combine introduces the `Scheduler` protocol
- ... adopted by `DispatchQueue`, `RunLoop` and others
- ... lets you determine the execution context for subscription and value delivery
*/

let passThroughSbj = PassthroughSubject<String, Never>()
let receivingMainQueue = DispatchQueue.main
let receivingQueue = DispatchQueue(label: "receiving-queue")

/*:
## `subscribe(on:)`
- determines on which scheduler the subscription occurs
- useful to control on which scheduler the work _starts_
- may or may not impact the queue on which values are delivered
*/
print("\n* Demonstrating subscribe(on:)")
let numSequPub = [1,2,3,4,5].publisher

let numSequSubscribe = numSequPub.subscribe(on: DispatchQueue.global())

// setup a handler
.handleEvents(receiveOutput: { value in print("Value \(value) emitted on thread \(Thread.current)")})

/*:
## `receive(on:)`
- determines on which scheduler values will be received by the next operator and then on
- used with a `DispatchQueue`, lets you control on which *queue* values are being delivered
*/
// let receivingQueue = DispatchQueue(label: "receiving-queue")
.receive(on: receivingMainQueue)

// subscribe on global dispatch
.sink { value in print("Received value: \(value) on thread \(Thread.current)") }

//An object that controls access to a resource across multiple execution contexts through use of a traditional counting semaphore.
let firstStepDone = DispatchSemaphore(value: 0)

//: [Next](@next)
