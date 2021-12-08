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
struct DataClass: Codable {
    let stations: [Station]
}
