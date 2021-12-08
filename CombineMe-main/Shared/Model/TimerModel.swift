//
//  TimerModel.swift
//  TimerModel
//
//  Created by iOS Developer on 8/13/21.
//

import Foundation
// import Combine
// Only want one and use as a reference everywhere
@MainActor
class TimerModel : ObservableObject, Identifiable {
    
    @Published var num:Int  = 7
    
    //From Combine
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // From Swift 5.5
    func incNum() async {
        await Task.sleep(2_000_000_000) // called every two sec.
        num += 1
    }
    
    func start() async {
        for _ in 0...100 {
            await incNum()
        }
    }
    
}
