//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport


var greeting = "Hello, playground"

struct ContentView: View {
    var body: some View {
        VStack {
            Text("some text")
            Text("**some text**")
            Text("***some text***")
            Text("~~some text~~")
            Text("[a link](https://www.apple.com)")
        }.border(Color.blue)
            .frame(width: 300, height: 400)
    }
}

PlaygroundPage.current
    .setLiveView(ContentView())

//: [Next](@next)
