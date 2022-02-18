// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rentalUris = try? newJSONDecoder().decode(RentalUris.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.rentalUrisTask(with: url) { rentalUris, response, error in
//     if let rentalUris = rentalUris {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - RentalUris
struct RentalUris: Codable {
    let android, ios: String
}
