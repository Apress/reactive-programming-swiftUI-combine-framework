//
//  BikeListView.swift
//  BikeListView
//
//  Created by iOS Developer on 10/7/21.
//

import SwiftUI

struct BikeListView: View {
    @ObservedObject var sbViewModel: SharedBikeViewModel
    var body: some View {
        let stations = sbViewModel.stations
        List {
            ForEach(stations) {item in
                Text(item.name)
            }.onDelete(perform: { indexSet in
                sbViewModel.delete(indexSet: indexSet)
                
            })
        }.refreshable {sbViewModel.restoreAll() } //- iOS 15 only
    }
}

struct BikeListView_Previews: PreviewProvider {
    static var previews: some View {
        BikeListView(sbViewModel: SharedBikeViewModel())
    }
}
