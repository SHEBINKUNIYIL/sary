// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try? newJSONDecoder().decode(Result.self, from: jsonData)

import Foundation

// MARK: - BannerResult
struct BannerResult: Codable {
    let id: Int
    let metadata: Metadata
    let title, resultDescription, buttonText: String
    let expiryStatus: Bool
    let createdAt, startDate, expiryDate: String
    let image, photo: String
    let promoCode: String?
    let priority: Int
    let link, level: String
    let isAvailable: Bool
    let branches, cities: [Int]

    enum CodingKeys: String, CodingKey {
        case id, metadata, title
        case resultDescription = "description"
        case buttonText = "button_text"
        case expiryStatus = "expiry_status"
        case createdAt = "created_at"
        case startDate = "start_date"
        case expiryDate = "expiry_date"
        case image, photo
        case promoCode = "promo_code"
        case priority, link, level
        case isAvailable = "is_available"
        case branches, cities
    }
}
