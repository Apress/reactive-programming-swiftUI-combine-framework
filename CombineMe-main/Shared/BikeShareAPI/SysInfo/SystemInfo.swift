//
//  SystemInfo.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/1/20.
//

// SystemInfo.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let systemInfo = try? newJSONDecoder().decode(SystemInfo.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.systemInfoTask(with: url) { systemInfo, response, error in
//     if let systemInfo = systemInfo {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - SystemInfo
struct SystemInfo: Codable {
    let data: SysInfoDataClass
    let lastUpdated, ttl: Int

    enum CodingKeys: String, CodingKey {
        case data
        case lastUpdated = "last_updated"
        case ttl
    }
}
