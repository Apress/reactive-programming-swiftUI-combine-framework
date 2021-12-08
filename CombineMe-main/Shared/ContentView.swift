//
//  ContentView.swift
//  Shared
//
//  Created by ZoeWave on 7/18/20.
//

import SwiftUI

class AppTitle: ObservableObject {
    @Published var title = "Shared Bikes"
}

struct ContentView: View {
    @StateObject var appTitle = AppTitle()
    var body: some View {
        HomeView().environmentObject(appTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
