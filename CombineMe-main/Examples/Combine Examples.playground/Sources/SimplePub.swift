//
//  SimplePublisher.swift
//  CombineMe
//
//  Created by Swift Developer on 8/6/20.
//

import Foundation


public class Test1 {
  public static func run() {
    print("hi")
  }
}

public struct SimplePub {
    
    public init() {
        
    }
    
    public func pub() {
        // type of publisher Publishers.Sequence<[Int], Never>
        [1, 2, 3]
            .publisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Something went wrong: \(error)")
                case .finished:
                    print("Received Completion")
                }
            }, receiveValue: { value in
                print("Received value \(value)")
            })
    }
    
    
    public func pubMap() {
        // type of publisher Publishers.Sequence<[Int], Never>
        [1, 2, 3]
            .publisher
            .map { num in num * 2}
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Something went wrong: \(error)")
                case .finished:
                    print("Received Completion")
                }
            }, receiveValue: { value in
                print("Received value \(value)")
            })
    }
    
    public func pubCollect() {
    [1, 2, 3, 4, 5]
      .publisher
      .collect(2)
      .sink(receiveValue: { value in
        print("Received value \(value)")
      })
    }
    
    

}
