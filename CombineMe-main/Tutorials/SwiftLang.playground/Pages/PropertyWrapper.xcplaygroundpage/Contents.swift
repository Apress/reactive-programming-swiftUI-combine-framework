//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// You can think of property wrapper as a regular property, which delegates its get and set to some other type.

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

// John Appleseed
var user = User(firstName: "john", lastName: "appleseed")
print("\(user.firstName) \(user.lastName)")

// John Apple
user.lastName = "apple"
print("\(user.firstName)  \(user.lastName)")

@propertyWrapper struct AddOne {
    var wrappedValue: Int {
        didSet { wrappedValue = wrappedValue + 1 }
    }

    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue + 2 // can be the cause of a bug!
    }
    
    var projectedValue: AddOne { return self }
}

struct AddOneNumber {
    @AddOne var myNum: Int
    
    func infoWrapper() {
        print("~~~~ Info ~~~~")
        print("wrappedValue= ", myNum)
        print("wrapper type itself= ",_myNum)
        print("projectedValue= ", $myNum)
    }
    
}

var theNum = AddOneNumber(myNum: 5)

print("theNum is init " , theNum.$myNum)

theNum.myNum = 4
print("theNum set with did set ", theNum.$myNum)

//theNum.infoWrapper()

print("End")
//: [Next](@next)
