//
//  BikeStationView.swift
//  BikeStationView
//
//  Created by iOS Developer on 10/4/21.
//

import SwiftUI

struct BikeStationView: View {
    @StateObject var sbViewModel = SharedBikeViewModel()

    var body: some View {
        NavigationView {
        List(sbViewModel.stations) { station in
            NavigationLink(destination: BikeMapView(station: station)) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(station.name)
                            .font(.headline)
                        Text("Capacity \(station.capacity)")
                            .font(.subheadline)
                    }
                }
            }.navigationBarTitle("Bike Station Maps")
        }
    }
    }
}


struct BikeStationView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            BikeStationView(sbViewModel: SharedBikeViewModel())
        }
    }
}
