//
//  SharedBikeViewModel.swift
//  SharedBikeViewModel
//
//  Created by iOS Developer on 10/3/21.
//
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
    private let bikeInfoService : BikeInfoService
    
    
    init() {
        bikeInfoService = BikeInfoAPI()
        fetchBikeInfo()
        fetchSysInfo()
    }
    
    // Using Combine
    //var cancellable : AnyCancellable?
    func fetchBikeInfo() {
        bikeInfoService.stationInfo() // Publisher <StationInfo, Never Error>
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {print ("Received completion: \($0).")},
                  receiveValue: {data in
                  print ("Received Station Data: \(data.data.stations[0]).")
                self.stations = data.data.stations
            })
            .store(in: &disposables)  // commet out in demo
    }
    
    
    func fetchSysInfo() {
        bikeInfoService.sysInfo() //AnyPublisher<SystemInfo, Error>
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {print ("Received completion: \($0).")},
                  receiveValue: {data in
                // print ("Received System Info: \(data).")
                self.sysInfo = data.data
            })
            .store(in: &disposables)
    }
    
    func deleteAll() {
        stations = []
        sysInfo = nil
    }
    
    func delete(indexSet : IndexSet) {
        for index in indexSet {
            stations.remove(at: index)
        }
    }
    
    func deleteFirst() {
        if(!stations.isEmpty) {
            stations.removeFirst(1)
        }
    }
    
    func deleteLast() {
        if(!stations.isEmpty) {
            stations.removeLast(1)
        }
    }
    
    
    func restoreAll() {
        fetchBikeInfo()
        fetchSysInfo()
        //stations = stationCopy
    }
    
    // Using async / await
}
