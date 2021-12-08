//
//  GikeGridView.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/9/20.
//

import SwiftUI

struct GikeGridView: View {
    @EnvironmentObject var appTitle: AppTitle
    @ObservedObject var viewModel = SharedBikeViewModel()

    
    // use SF Symbols
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        VStack{
            let name = viewModel.sysInfo?.name ?? "name"
            let phone = viewModel.sysInfo?.phoneNumber ?? "number"
            let stations = viewModel.stations
            Text(appTitle.title)
            Text(name + " / Phone: " + phone)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(stations) { item in
                        VStack {
                            Capsule()
                                .fill(Color.blue)
                                .frame(height:20)
                            Text(item.name)
                        }
                    }
                }//.refreshable {viewModel.restoreAll() }
            }.padding(.horizontal)
            
            
            List {
                ForEach(stations) {item in
                    Text(item.name)
                }
            }.refreshable {viewModel.restoreAll() }
            
            HStack{
                Button("Del1") {
                    viewModel.deleteFirst()
                }
                
                Button("Delete") {
                    viewModel.deleteAll()
                }
                
                Button("Restore") {
                    viewModel.restoreAll()
                }
                
                
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GikeGridView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
