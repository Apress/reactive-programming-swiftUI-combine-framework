//
//  DataClass.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/1/20.
//
// DataClass.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataClass = try? newJSONDecoder().decode(DataClass.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.dataClassTask(with: url) { dataClass, response, error in
//     if let dataClass = dataClass {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - SysInfoDataClass

struct SysInfoDataClass: Codable {
    let email, dataOperator: String
    let url: String
    let purchaseURL, name, shortName, systemID: String
    let licenseURL, startDate, phoneNumber, language: String
    let timezone: String

    enum CodingKeys: String, CodingKey {
        case email
        case dataOperator = "operator"
        case url
        case purchaseURL = "purchase_url"
        case name
        case shortName = "short_name"
        case systemID = "system_id"
        case licenseURL = "license_url"
        case startDate = "start_date"
        case phoneNumber = "phone_number"
        case language, timezone
    }
}
