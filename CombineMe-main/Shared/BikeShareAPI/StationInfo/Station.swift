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
    let electricBikeSurchargeWaiver: Bool
    let stationType: StationType
    let eightdStationServices: [JSONAny]
    let rentalUris: RentalUris
    let eightdHasKeyDispenser: Bool
    let externalID, name: String
    let rentalMethods: [RentalMethod]
    let hasKiosk: Bool
    let capacity: Int
    let lon: Double
    let legacyID: String
    let regionID: String?
    let shortName, stationID: String
    let lat: Double

    enum CodingKeys: String, CodingKey {
        case electricBikeSurchargeWaiver = "electric_bike_surcharge_waiver"
        case stationType = "station_type"
        case eightdStationServices = "eightd_station_services"
        case rentalUris = "rental_uris"
        case eightdHasKeyDispenser = "eightd_has_key_dispenser"
        case externalID = "external_id"
        case name
        case rentalMethods = "rental_methods"
        case hasKiosk = "has_kiosk"
        case capacity, lon
        case legacyID = "legacy_id"
        case regionID = "region_id"
        case shortName = "short_name"
        case stationID = "station_id"
        case lat
    }
}
