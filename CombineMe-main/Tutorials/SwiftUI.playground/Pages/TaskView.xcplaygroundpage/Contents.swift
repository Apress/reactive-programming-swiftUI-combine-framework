//: [Previous](@previous)

import Foundation
import SwiftUI

var greeting = "Hello, playground"

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let text: String
}

struct ContentView: View {
    @State private var messages = [Message]()

    var body: some View {
        NavigationView {
            List(messages) { message in
                VStack(alignment: .leading) {
                    Text(message.from)
                        .font(.headline)
                    Text(message.text)
                }
            }
            .navigationTitle("Inbox")
        }
        .task {
            do {
                let url = URL(string: "https://www.hackingwithswift.com/samples/messages.json")!
                let (data, _) = try await URLSession.shared.data(from: url)
                messages = try JSONDecoder().decode([Message].self, from: data)
            } catch {
                messages = []
            }
        }
    }
}


//: [Next](@next)

