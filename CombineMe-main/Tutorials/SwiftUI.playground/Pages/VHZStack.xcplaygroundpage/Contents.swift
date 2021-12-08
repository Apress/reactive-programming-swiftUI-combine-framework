//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        // default is zero but you can go +/-
        VStack {
            HStack {
                Image(uiImage: UIImage(named: "bike.jpg")!).resizable()
                    .frame(width: 100.0, height: 100.0)
                ZStack {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 50, height: 50)
                        .zIndex(1)
                    
                    // has index of zero
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                }
            }
            .border(Color.green)
            .frame(width: 300, height: 150)
            .border(Color.red)
            Text("This guy needs to stop biking and start coding")
        }
        .border(Color.blue)
        .frame(width: 500, height: 500)
        
    }
}

PlaygroundPage.current
    .setLiveView(ContentView())

//: [Next](@next)
