//
//  ContentView.swift
//  CombineSwiftUI
//
//  Created by iOS Developer on 10/3/21.
//

import SwiftUI

class AppTitle: ObservableObject {
    @Published var title = "Shared Bikes"
}

struct ContentView: View {
    @StateObject var appTitle = AppTitle()
    var body: some View {
        VStack() {
            Text("Bike Stations").padding()
            MainView().environmentObject(appTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
