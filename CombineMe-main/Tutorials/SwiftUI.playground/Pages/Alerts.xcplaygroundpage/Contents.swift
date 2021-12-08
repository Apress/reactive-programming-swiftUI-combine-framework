//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct ContentViewAlert: View {
    @State private var showingAlert = false
    @State private var showingSheet = false

    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Show Alert")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .background(Color.red)
                .frame(minWidth: 500, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
            
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
        Spacer()
        
        // Action Sheet

        Button(action: {
            self.showingSheet = true
        }) {
            Text("Show Action Sheet")
        }
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
        }
    }
    

     
}

PlaygroundPage.current
    .setLiveView(ContentViewAlert())
//: [Next](@next)
