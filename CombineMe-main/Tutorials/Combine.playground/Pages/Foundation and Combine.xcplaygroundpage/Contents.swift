//: [Previous](@previous)

import Foundation
import Combine
import UIKit

import PlaygroundSupport

/*:
 ## Foundation and Combine
 Foundation adds Combine publishers for many types, like:
 */

/*:
 Every project have CoreData with Combine
 */

/*:
 ### A URLSessionTask publisher and a JSON Decoding operator
 */
struct DecodableExample: Decodable { }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.avanderlee.com/feed/")!)
    .handleEvents(receiveOutput: { value in
        print("Value \(value)")
    })
    .print("step ----> ")
    .map { $0.data }
    .decode(type: DecodableExample.self, decoder: JSONDecoder())

/*:
 ### A Publisher for notifications
 */
NotificationCenter.default.publisher(for: .NSSystemClockDidChange)

/*:
 ### KeyPath binding to NSObject instances
 */
let ageLabel = UILabel()
Just(28)
    .map { "Age is \($0)" }
    .assign(to: \.text, on: ageLabel)

/*:
### A Timer publisher exposing Cocoa's `Timer`
- this one is a bit special as it is a `Connectable`
- ... use `autoconnect` to automatically start it when a subscriber subscribes
*/
let publisher = Timer
	.publish(every: 1.0, on: .main, in: .common)
	.autoconnect()

//: [Next](@next)
