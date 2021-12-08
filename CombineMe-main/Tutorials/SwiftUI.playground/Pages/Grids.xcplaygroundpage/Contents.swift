//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    let data = (1...30).map { "Item \($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        //GridItem(.flexible()),
        //GridItem(.flexible())
    ]
    
    // New in iOS 14
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .padding(.horizontal)
                }
                //Spacer()
            } .background(Color.green)
            .frame(minWidth: 500, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.red)
            //Spacer()
        }
    }
}

PlaygroundPage.current
    .setLiveView(ContentView())


//: [Next](@next)
