//
//  SharedBikeService.swift
//  SharedBikeService
//
//  Created by iOS Developer on 10/3/21.
//

import Foundation
import Combine

protocol BikeInfoService {
    func sysInfo() -> AnyPublisher<SystemInfo, Error>
    func stationInfo() -> AnyPublisher<StationInfo, Error>
}

class BikeInfoAPI {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension BikeInfoAPI: BikeInfoService {
    func sysInfo() -> AnyPublisher<SystemInfo, Error> {
        return getSysInfo(www_url : systemURLComponents().url!)
    }
    
    func stationInfo() -> AnyPublisher<StationInfo, Error> {
        return getStationInfo(www_url : stationURLComponents().url!)
    }
    
    func getStationInfo(www_url:URL) -> AnyPublisher<StationInfo, Error>{
        /* cancellable = */
        print(www_url)
        return session.dataTaskPublisher(for: www_url)
            //.print("step ==> ") // debug
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                //print("data:: \(element.data)")
                return element.data
            }
            .decode(type: StationInfo.self, decoder: JSONDecoder())
            .eraseToAnyPublisher() // return with a publisher of <StationInfo, Error>
    }
    
    func getSysInfo(www_url:URL) -> AnyPublisher<SystemInfo, Error>{
        /* cancellable = */
        print(www_url)
        return session.dataTaskPublisher(for: www_url)
            //.print("step ==> ") // debug
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                //print("data \(element.data)")
                return element.data
            }
            .decode(type: SystemInfo.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

private extension BikeInfoAPI {
    struct GobalBikeAPI {
        static let scheme = "https"
        static let host = "gbfs.baywheels.com"
        static let path = "/gbfs/en"
        //static let key = "<your key>"
    }
    
    func stationURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = GobalBikeAPI.scheme
        components.host = GobalBikeAPI.host
        components.path = GobalBikeAPI.path + "/station_information.json"
        
        components.queryItems = [
            //URLQueryItem(name: "name", value: value)
        ]
        return components
    }
    
    func systemURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = GobalBikeAPI.scheme
        components.host = GobalBikeAPI.host
        components.path = GobalBikeAPI.path + "/system_information.json"
        
        components.queryItems = [
            //URLQueryItem(name: "name", value: value)
        ]
        return components
    }
    
}


