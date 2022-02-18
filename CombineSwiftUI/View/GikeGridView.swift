//
//  GikeGridView.swift
//  GikeGridView
//
//  Created by iOS Developer on 10/4/21.
//

import SwiftUI

struct GikeGridView: View {
    @ObservedObject var sbViewModel: SharedBikeViewModel
    @EnvironmentObject var appTitle: AppTitle

    
    // use SF Symbols
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        VStack{
            let name = sbViewModel.sysInfo?.name ?? "name"
            let phone = sbViewModel.sysInfo?.phoneNumber ?? "number"
            let stations = sbViewModel.stations

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
                }.refreshable {sbViewModel.restoreAll() } // - iOS 15 only
            }.padding(.horizontal)
            
            HStack{
                Button("Del1st") {
                    sbViewModel.deleteFirst()
                }
                
                Button("DelEnd") {
                    sbViewModel.deleteLast()
                }
                
                Button("DelAll") {
                    sbViewModel.deleteAll()
                }
                
                Button("Restore") {
                    sbViewModel.restoreAll()
                }
    
            }
            
            BikeListView(sbViewModel: sbViewModel)
            
        }
    }
}

struct GikeGridView_Previews: PreviewProvider {

    static var previews: some View {
        GikeGridView(sbViewModel: SharedBikeViewModel())
    }
}

