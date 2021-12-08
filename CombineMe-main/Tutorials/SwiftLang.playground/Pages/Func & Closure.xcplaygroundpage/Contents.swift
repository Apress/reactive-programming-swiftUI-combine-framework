//: [Previous](@previous)


/**
 Notes :
 
External and Internal Names
Functions are just normal types
 **/
import Foundation

var str = "Hello, playground"

func crazy(extName intName:String, extName1 intName1 :String, extName2 intName2:Int) -> String{
    return("the names \(intName) \(intName1) \(intName2)")
}
print(crazy(extName:"one", extName1:"two", extName2:2))


func greet1(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet1(person: "Bob", day: "Tuesday"))
//print(greet1(day: "Monday", person: "ash"))


func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet2("John", on:"Wednesday"))


func greet3(_ person: String,_ day: String,_ sday:String) -> String { // this looks like every other language
    "Hello \(person), today is \(day), or maybe \(sday)."
}
print(greet3("John", "Wednesday", "Sunday"))


//var completionHandler: (Float)->Void = {(arg: Float) -> Void in}
//var completionHandler: (Float)->Void = { arg in }
var completionHandler: (Float)->Void = {num in print("This closure print s a num ", num)}
completionHandler(4.0)


// Swift is a higher order functional programming lang.
// a function is just a type
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
// var is a function
var increment = makeIncrementer()
print("This was incremented" , increment(7))



// The code in a closure has access to things like variables and functions that were available
// in the scope where the closure was created, even if the closure is in a different scope when it is executed
var numbers = [20, 19, 7, 12]

// Closure captures the numbers.
func capNum() -> ((Int) -> Int) {
    func getNum(idx: Int) -> Int {
        return numbers[idx]
    }
    return getNum
}

// capNums contains numbers!
var capNums = capNum()
print("The second in numbers is:", capNums(1))

// passing a closure to a map
let ans = numbers.map ({ (number: Int) -> Int in
    let result = 5 * number
    return result
})
let short_ans = numbers.map { $0 * 5 }
print("This is the ans \(ans) and short ans \(short_ans)")


// escaping closure
var closureArr:[()->()] = [/*empty of void->void closures*/]

func testFunctionWithEscapingClosure(myClosure:@escaping() -> Void) {
    print("test escaping function called")
    closureArr.append(myClosure)
    // myClosure() none escaping
}

testFunctionWithEscapingClosure(myClosure: {print("escaping closure called")})
closureArr[0]()

// shorting the name
let names = ["ash","bob"]
var reversedNames:[String] = []
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } ) // we know names is a String
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } ) // must return a Bool
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } ) // remove return
reversedNames = names.sorted(by: { $0 > $1 } ) // use $#
reversedNames = names.sorted(by: >) // because sort takes two args and > uses them we can remove them

// trailing closure -- Kotlin also does this
func someFunctionThatTakesAClosure(closure: ([String]) -> Void) {
    // function body goes here
    closure(names) // names is the input to the closure.
}

// trailing closure is only at the call sight.
someFunctionThatTakesAClosure(closure: { people in
    for person in people {
        print(person)
    }
})

someFunctionThatTakesAClosure() { people in
    for person in people {
        print(person)
    }
}

someFunctionThatTakesAClosure { people in
    for person in people {
        print(person)
    }
}

var closeCall : ([String]) -> Void = { people in
    for person in people {
        print(person)
    }
}

// same as the above
someFunctionThatTakesAClosure(closure: closeCall)

/* Swift 5.1 features
struct ContentViewHW: View {
    @State var showPrint:Bool // property wrapper
    var body: some View { // opaque return type
        VStake {          // Trailing Closure
            Text("Hello World")
        }
        // Omit return type of View
    }
}*/

//: [Next](@next)
