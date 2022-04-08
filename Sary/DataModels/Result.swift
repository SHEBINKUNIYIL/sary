// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try? newJSONDecoder().decode(Result.self, from: jsonData)

import Foundation

// MARK: - Result
struct Result: Codable {
    let id: Int
    let metadata: Metadata
    let title, subtitle: String
    let data: [Datum]
    let dataType: DataTypes
    let showTitle: Bool
    let uiType: UIType
    let rowCount: Int
    let showMoreEnabled: Bool
    let excludedBusinessSegments: [JSONAny]
    let groupID, itemsCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, metadata, title, subtitle, data
        case dataType = "data_type"
        case showTitle = "show_title"
        case uiType = "ui_type"
        case rowCount = "row_count"
        case showMoreEnabled = "show_more_enabled"
        case excludedBusinessSegments = "excluded_business_segments"
        case groupID = "group_id"
        case itemsCount = "items_count"
    }
}
