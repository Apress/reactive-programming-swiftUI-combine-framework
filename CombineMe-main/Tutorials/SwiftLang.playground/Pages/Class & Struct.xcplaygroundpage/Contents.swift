import UIKit
import CoreGraphics

/*:
 // Intialization is a entire day long class -- Init everything or nothing
 // https://docs.swift.org/swift-book/LanguageGuide/Initialization.html
 */

// Class is a reference type so using the pointer it is easy to tell equality.
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// Object -- is an instance of a class.
var shape = Shape()
shape.numberOfSides = 7
print(shape.simpleDescription())


// Struct is a value type and the key to Protocol Oriented Programming
// conform to protocol but not inheritance.
struct Card {
    var rank: Int
    var suit: String
    func simpleDescription() -> String {
        return "The \(rank) of \(suit)"
    }
}

let threeOfSpades = Card(rank: 7, suit: "spades")
print(threeOfSpades.simpleDescription())

// people put extensions on classes / structs to make them better
struct Person {
    var firstName: String
    var lastName: String
}

extension Person {
    init(name: String) {
        let split = name.components(separatedBy: " ")
        firstName = split.first ?? ""
        lastName = split.last ?? ""
    }
}

let taylor1 = Person(firstName: "Taylor", lastName: "Swift")
let taylor2 = Person(name: "Taylor Swift")


// When to use a struct vs class
// always use a sturct unless you need ...
/*:
 Classes can inherit from another class, which you can’t do with structs. Conversely, structs can implement protocols.
 Classes can be deinitialized, i.e. they can implement a deinit function, and you can make one or more references to the same class (i.e., classes are a reference type).
 Classes come with the built-in notion of identity, because they’re reference types. With the identity operator === you can check if two references (variables, constants, properties, etc.) refer to the same object.
 
 struct House: Equatable { // emplement the "==" operator to be Equatable
     var street: String

     static func == (lhs: House, rhs: House) -> Bool {
         return lhs.street == rhs.street
     }
 }
 */


struct Item {
    var name : String
    mutating func setName(n:String) {
        name = n
    }
}

class ClassItem {
    var name: String = "none"
    func setName(n:String) {
        name = n
    }
}

let oneItem = Item.init(name: "One")
let twoItem = Item.init(name: "Two")

func printItem(it:Item){
    print(it.name)
    //it.setName(n: "new")
}

func printItem(it:ClassItem) {
    print(it.name)
    it.setName(n: "new")
}

let classOne = ClassItem()

printItem(it: classOne)

print(classOne.name)


