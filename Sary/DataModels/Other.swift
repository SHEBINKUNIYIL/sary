// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let other = try? newJSONDecoder().decode(Other.self, from: jsonData)

import Foundation

// MARK: - Other
struct Other: Codable {
    let showSpecialOrderView: Bool
    let uncompletedProfileSettings: UncompletedProfileSettings
    let showVat: Bool
    let header: Header
    let businessStatus: BusinessStatus

    enum CodingKeys: String, CodingKey {
        case showSpecialOrderView = "show_special_order_view"
        case uncompletedProfileSettings = "uncompleted_profile_settings"
        case showVat = "show_vat"
        case header
        case businessStatus = "business_status"
    }
}
