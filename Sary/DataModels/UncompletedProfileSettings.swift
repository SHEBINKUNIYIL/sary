// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let uncompletedProfileSettings = try? newJSONDecoder().decode(UncompletedProfileSettings.self, from: jsonData)

import Foundation

// MARK: - UncompletedProfileSettings
struct UncompletedProfileSettings: Codable {
    let showTag: Bool
    let message: String
    let image: String
    let isCompletedProfile: Bool

    enum CodingKeys: String, CodingKey {
        case showTag = "show_tag"
        case message, image
        case isCompletedProfile = "is_completed_profile"
    }
}
