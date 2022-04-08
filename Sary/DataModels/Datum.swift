// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let datum = try? newJSONDecoder().decode(Datum.self, from: jsonData)

import Foundation

// MARK: - Datum
struct Datum: Codable {
    let metadata: Metadata?
    let groupID: Int?
    let filters: [Filter]?
    let name: String?
    let image: String?
    let cover: String?
    let header: JSONNull?
    let deepLink: String?

    enum CodingKeys: String, CodingKey {
        case metadata
        case groupID = "group_id"
        case filters, name, image, cover, header
        case deepLink = "deep_link"
    }
}
