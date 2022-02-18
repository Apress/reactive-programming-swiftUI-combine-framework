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

// MARK: - DataClass
struct SysInfoDataClass: Codable {
    let phoneNumber, timezone, name, licenseURL: String
    let language, startDate, shortName: String
    let url: String
    let systemID, dataOperator, purchaseURL, email: String

    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case timezone, name
        case licenseURL = "license_url"
        case language
        case startDate = "start_date"
        case shortName = "short_name"
        case url
        case systemID = "system_id"
        case dataOperator = "operator"
        case purchaseURL = "purchase_url"
        case email
    }
}
