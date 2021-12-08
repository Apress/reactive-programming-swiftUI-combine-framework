import Foundation
import Combine

public struct SubTest {
    public func callSub() {
        (0...6).publisher.subscribe(IntSubscriber())
    }
}


class IntSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        print("Received subscription")
        subscription.request(.max(1))
    }
    
    func receive(_ input: Input) -> Subscribers.Demand {
        print("Received input: \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Received completion: \(completion)")
    }
    
}




