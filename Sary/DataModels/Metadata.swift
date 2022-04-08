// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let metadata = try? newJSONDecoder().decode(Metadata.self, from: jsonData)

import Foundation

// MARK: - Metadata
struct Metadata: Codable {
    let title: String
    let subTitle: String?
    let consumableDisplay: JSONNull?

    enum CodingKeys: String, CodingKey {
        case title
        case subTitle = "sub_title"
        case consumableDisplay = "consumable_display"
    }
}
