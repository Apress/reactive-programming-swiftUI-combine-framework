// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stationInfo = try? newJSONDecoder().decode(StationInfo.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.stationInfoTask(with: url) { stationInfo, response, error in
//     if let stationInfo = stationInfo {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - StationInfo
struct StationInfo: Codable {
    let data: DataClass
    let lastUpdated, ttl: Int

    enum CodingKeys: String, CodingKey {
        case data
        case lastUpdated = "last_updated"
        case ttl
    }
}
