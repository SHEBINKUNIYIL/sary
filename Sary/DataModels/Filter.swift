// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let filter = try? newJSONDecoder().decode(Filter.self, from: jsonData)

import Foundation

// MARK: - Filter
struct Filter: Codable {
    let metadata: Metadata
    let filterID: Int
    let name: String
    let image: JSONNull?

    enum CodingKeys: String, CodingKey {
        case metadata
        case filterID = "filter_id"
        case name, image
    }
}
