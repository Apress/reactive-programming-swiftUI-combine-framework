//
//  SharedBikeViewModel.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/1/20.
//
// ViewModel Create the Model

/**
 Rules:
 The View has a reference to the ViewModel, but not vice-versa.
 The ViewModel has a reference to the Model, but not vice-versa.
 The View has no reference to the Model or vice-versa.
 */

import Foundation
import Combine
// Only want one and use as a reference everywhere
class SharedBikeViewModel : ObservableObject, Identifiable {
    
    @Published var stations: [Station] = []
    @Published var sysInfo: SysInfoDataClass? = nil
    private var disposables = Set<AnyCancellable>()
    private let bikeInfoCall =  BikeInfoAPI()
    private var stationCopy: [Station] = []
    
    
    init() {
        fetchBikeInfo()
        fetchSysInfo()
    }
    
    // Using Combine
    //var cancellable : AnyCancellable?
    func fetchBikeInfo() {
        bikeInfoCall.stationInfo()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {print ("Received completion: \($0).")},
                  receiveValue: {data in
                    //print ("Received user: \(data).")
                self.stations = data.data.stations
                  })
            .store(in: &disposables)
    }
    
    
    func fetchSysInfo() {
        bikeInfoCall.sysInfo()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {print ("Received completion: \($0).")},
                  receiveValue: {data in
                    print ("Received user: \(data).")
                self.sysInfo = data.data
                  })
            .store(in: &disposables)
    }
    
    func deleteAll() {
        stations = []
        sysInfo = nil
    }
    
    func deleteFirst() {
        if(!stations.isEmpty) {
            stations.removeFirst(1)
        }
    }
    
    
    func restoreAll() {
        fetchBikeInfo()
        fetchSysInfo()
        //stations = stationCopy
    }
    
    // Using async / await
}
