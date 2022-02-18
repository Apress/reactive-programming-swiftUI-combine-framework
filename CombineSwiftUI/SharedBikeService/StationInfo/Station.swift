// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let station = try? newJSONDecoder().decode(Station.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.stationTask(with: url) { station, response, error in
//     if let station = station {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Station
struct Station: Codable, Identifiable {
    let id = UUID()
    let regionID: String?
    let eightdHasKeyDispenser: Bool
    let stationType: StationType
    let lon: Double
    let name: String
    let hasKiosk, electricBikeSurchargeWaiver: Bool
    let rentalUris: RentalUris
    let capacity: Int
    let shortName: String
    let rentalMethods: [RentalMethod]
    let lat: Double
    let stationID: String
    let eightdStationServices: [JSONAny]
    let externalID, legacyID: String

    enum CodingKeys: String, CodingKey {
        case regionID = "region_id"
        case eightdHasKeyDispenser = "eightd_has_key_dispenser"
        case stationType = "station_type"
        case lon, name
        case hasKiosk = "has_kiosk"
        case electricBikeSurchargeWaiver = "electric_bike_surcharge_waiver"
        case rentalUris = "rental_uris"
        case capacity
        case shortName = "short_name"
        case rentalMethods = "rental_methods"
        case lat
        case stationID = "station_id"
        case eightdStationServices = "eightd_station_services"
        case externalID = "external_id"
        case legacyID = "legacy_id"
    }
}
