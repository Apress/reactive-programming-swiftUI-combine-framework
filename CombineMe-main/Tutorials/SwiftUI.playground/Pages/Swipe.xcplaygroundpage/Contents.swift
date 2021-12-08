//: [Previous](@previous)

/*
 From
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-custom-swipe-action-buttons-to-a-list-row
 */

import Foundation
import SwiftUI
import PlaygroundSupport


var greeting = "Hello, playground"

struct ContentView: View {
    let friends = ["Antoine", "Bas", "Curt", "Dave", "Erica"]

    var body: some View {
        NavigationView {
            List {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                        .swipeActions(allowsFullSwipe: false) {
                            Button {
                                print("Muting conversation")
                            } label: {
                                Label("Mute", systemImage: "bell.slash.fill")
                            }
                            .tint(.indigo)

                            Button(role: .destructive) {
                                print("Deleting conversation")
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                }
            }
        }
    }
}

PlaygroundPage.current
    .setLiveView(ContentView())
//: [Next](@next)
