//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport


var greeting = "Hello, playground"

struct ContentView: View {
    @State private var currentCount = 0
    //var currentCount = 0
    var body: some View {
        TabView {
            VStack {
                List {
                    Text("Wi-Fi")
                        .badge("LAN Solo")
                    
                    Text("Bluetooth")
                        .badge("On")
                }
                Button(action: {currentCount += 1}) {
                    Text("Add Count")
                }.padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .badge(currentCount)
        }.border(Color.blue)
        .frame(width: 300, height: 400)
    }
}

PlaygroundPage.current
    .setLiveView(ContentView())
//: [Next](@next)
