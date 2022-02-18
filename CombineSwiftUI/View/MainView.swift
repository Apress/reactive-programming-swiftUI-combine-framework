//
//  MainView.swift
//  MainView
//
//  Created by iOS Developer on 10/4/21.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainSBViewModel = SharedBikeViewModel()

    
    var body: some View {
        TabView {
            GikeGridView(sbViewModel: mainSBViewModel)
                .tabItem {
                    Image(systemName: "bicycle.circle")
                    Text("Stations")
                }.badge(mainSBViewModel.stations.count) // now very easy to add iOS 15
            BikeListView(sbViewModel: mainSBViewModel)
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("List")
                }.badge(mainSBViewModel.stations.count)
            BikeStationView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }//.badge(474)
        }
    }
}
