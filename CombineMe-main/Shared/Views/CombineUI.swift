//
//  CombineUI.swift
//  CombineUI
//
//  Created by iOS Developer on 8/13/21.
//

import SwiftUI

struct CombineUI: View {
    @ObservedObject var timerModel = TimerModel()
    @State private var currentTime: Date = Date()

    // get a pic.
    let pic = URL(string: "https://images.unsplash.com/photo-1526849875464-471c91f5ecae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=510&q=200")
    
    var body: some View {
        VStack {
            Text("Combine Timer! \(currentTime) ")
                .onReceive(timerModel.timer) { newCurrentTime in
                      self.currentTime = newCurrentTime
                }
            
            
            Text("Async Timer! \(timerModel.num)")
                .foregroundColor(Color.random())
                .font(.largeTitle)
                .task {
                    await timerModel.start()
                }
            AsyncImage(url:pic ) // SwiftUI not Combine. // Swift 5.5 can get image
        }
    }
}

extension Color {
    static func random() -> Color {
        return Color(
             red: .random(in: 0...1),
           green: .random(in: 0...1),
            blue: .random(in: 0...1)
           // alpha: 1.0
        )
    }
}

struct CombineUI_Previews: PreviewProvider {
    static var previews: some View {
        CombineUI()
    }
}
