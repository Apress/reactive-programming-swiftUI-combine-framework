//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// credit -- from https://www.hackingwithswift.com/articles/212/whats-new-in-swift-5-2

//Key Path Expressions as Closure / Functions
struct User {
    let name: String
    let age: Int
    let bestFriend: String?

    var canVote: Bool {
        age >= 18
    }
}

//Use Key Path Expressions as Closure / Functions
let eric = User(name: "Eric Effiong", age: 18, bestFriend: "Otis Milburn")
let maeve = User(name: "Maeve Wiley", age: 19, bestFriend: nil)
let otis = User(name: "Otis Milburn", age: 17, bestFriend: "Eric Effiong")
let users = [eric, maeve, otis]

let userNames = users.map(\.name)

let idxNames = users.map { $0.name }
print("user Names \(userNames) index \(idxNames)")

let voters = users.filter(\.canVote)
for vot in voters {
    print("voters", vot.name)
}

let bestFriends = users.compactMap(\.bestFriend)
print("bestFriends",bestFriends)

// Callable values of user-defined nominal types
struct Dice {
    var lowerBound: Int
    var upperBound: Int
    
    func callFunc() -> Int {
        (lowerBound...upperBound).randomElement()!
    }

    func callAsFunction() -> Int {
        (lowerBound...upperBound).randomElement()!
    }
}

let d10 = Dice(lowerBound: 0, upperBound: 10)

print("nice call \(d10())")
print("odd call \(d10.callFunc())")


// Use with Mutating.

struct StepCounter {
    var steps = 0

    mutating func callAsFunction(count: Int) -> Bool {
        steps += count
        print(steps)
        return steps > 30
    }
}

var steps = StepCounter()
for i in 0...4 {
    print(steps(count: 10))
}

// -- crazy

extension Double {
    func callAsFunction() -> Double {
        return self + 7
    }
    
    func addSeven() -> Double {
        return self + 7
    }
}
let sevenNumber = 2.0

print(sevenNumber())
print(sevenNumber.addSeven())
print(7())

/* Whats new in 5.3 */

/* Whats new in 5.4 */

/* Whats new in 5.5
 sync await - Swift structured concurrency
 */


//: [Next](@next)
