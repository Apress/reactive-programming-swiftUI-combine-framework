//: [Previous](@previous)

import Foundation


var greeting = "Hello, playground"

// Thanks to Paul Hudson

// hide file extenstions -- matches your finder [preferences / General / file extentions]

// auto import
// struct newView : View {} -> import SwiftUI

struct OptFun {
    func opfun(name :String?) {
        if let name = name { // if let is auto generated
            <#body#>
        }
    }
}

// Code completion is now two layers deep.

// Can generate complete exhaustive switch
struct PaintMixer {
    enum Color {
        case red, green, blue, orange
    }
    
    func handle(color: Color) {
        switch color {
            // XCode will auto generate this
        case .red:
            <#code#>
        case .green:
            <#code#>
        case .blue:
            <#code#>
        case .orange:
            <#code#>
        }
    }
    
    
    // auto single of plural
    func funStuff () {
        let geese = ["one","two"] // person in people
        for goose in geese { // make singel of the pural
            <#body#>
        }
        
        func first() -> String { "A" }
        func second() -> String { "B" }
        func third() -> String { "C" }
        
        func buildString() -> String {
            first() + second() + third()  // can place on second or third
        }
    }
    
    // we can minmize the error messages. [preferences / general / mini errors.
    // enable Vim Key bindings.
}


// make singel of the pural


//: [Next](@next)
