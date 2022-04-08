// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responsedata = try? newJSONDecoder().decode(Responsedata.self, from: jsonData)

import Foundation

// MARK: - Responsedata
struct Banner: Codable {
    let result: [BannerResult]
    let status: Bool
    
    enum CodingKeys: String, CodingKey {
        case status
        case result = "result"
    }
}
