//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

var greeting = "Hello, playground"

struct ContentView: View {
    var body: some View {
        VStack {
            Text("hi")
            //Image(uiImage: UIImage(named: "Material")!).resizable().frame(width: 100.0, height: 100.0)
        }
    }
}



PlaygroundPage.current
    .setLiveView(ContentView())


//: [Next](@next)
