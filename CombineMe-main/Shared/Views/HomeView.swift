//
//  SwiftUIView.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/7/20.
//

import SwiftUI

struct TestView: View {
    
    var body: some View {
        VStack {
            GikeGridView()
            NavigationView {
                NavigationLink(destination: BikeStationView()) {
                    Text("Bike Stations")
                }
#if os(iOS)
                .navigationBarTitle("Bike Stations")
#endif
                /*NavigationLink(destination: HomeView()) {
                 Text("Home")
                 }.navigationBarTitle("Bike Home")*/
            }
        }
    }
}

struct BikeList: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bike Image")
                ZStack {
#if os(iOS)
                    Image(uiImage: UIImage(named:"bike.jpg")!).resizable()
#elseif os(macOS)
                    Image(nsImage: NSImage(named:"bike")!).resizable()
#endif
                    //.frame(width: 100, height: 100)
                    //Image(uiImage: UIImage(named: "Material.png")!).resizable()
                    VStack {
                        Label("Bike", systemImage: "bicycle").padding().background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundColor(.secondary)
                        Text("Let find a station ").padding().background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundColor(.secondary)
                    }
                }
                NavigationLink(destination: BikeStationView()) {
                    Text("Bike Stations")
                }
#if os(iOS)
                .navigationBarTitle("Bike Stations")
#endif
            }.padding()
        }.padding()
    }
}


struct HomeView: View {
    var body: some View {
        TabView {
            GikeGridView()
                .tabItem {
                    Image(systemName: "bicycle.circle")
                    Text("Stations")
                }.badge(2) // now very easy to add
            BikeList()
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("Map")
                }.badge(5)
            CombineUI()
                .tabItem {
                    Image(systemName: "arrow.triangle.capsulepath")
                    Text("Combine")
                }.badge(7)
        }
    }
    
    func skip() {
        print("Menu Pressed")
    }
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
