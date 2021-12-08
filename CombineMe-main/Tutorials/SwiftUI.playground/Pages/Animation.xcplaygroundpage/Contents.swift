//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport
//import KingfisherSwiftUI

/*
 Swift Package Manager
 File > Swift Packages > Add Package Dependency
 Add `https://github.com/onevcat/Kingfisher.git`
 Select "Up to Next Major" with "6.0.0"
 */

struct ContentView : View {
    @State private var isButtonVisible = true
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.isButtonVisible.toggle()
                }) {
                    Text("Press me")
                }// not on button .animation(.easeInOut)
                // always try to use system images
                Image(systemName: "star.fill")
                    .foregroundColor(Color.purple)
            }
            
            Divider()
            VStack {
            Text("Hello, world!")
                .offset(y: isButtonVisible ? 0 : 300)
                // new in Swift iOS 15!
                //.animation(.linear(duration: 1), value: isButtonVisible)
                .animation(.easeInOut(duration: 2), value: isButtonVisible)
                //.animation(.spring(), value: isButtonVisible)
            }
            Divider()
            
            if isButtonVisible {
                HStack{
                    Image(uiImage: UIImage(named: "bike.jpg")!).resizable()
                        .frame(width: 32.0, height: 32.0)
                }
            }
            
            Button(action: {
                self.showDetail.toggle()
            }) {
                Image(systemName: "chevron.right.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(showDetail ? 90 : 0))
                    .scaleEffect(showDetail ? 10.5 : 1)
                    .padding()
                    .animation(.easeInOut(duration: 1), value:showDetail)
                    //.animation(.spring(), value:showDetail)
                    //.animation(.easeInOut(duration: 2), value:isButtonVisible)

            }
        }.frame(minWidth: 500,
         maxWidth: .infinity,
         minHeight: 500,
         maxHeight: .infinity,
         alignment: .topLeading)
    }
}


PlaygroundPage.current
    .setLiveView(ContentView())


//: [Next](@next)
