//
// Artwork.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Artwork: Codable, JSONEncodable, Hashable {

    public var id: Int?
    public var apiModel: String?
    public var apiLink: String?
    public var isBoosted: Bool?
    public var title: String?
    public var altTitles: [String]?
    public var description: String?
    public var imageId: String?
    public var altImageIds: [String]?
    public var dateDisplay: String?
    public var artistDisplay: String?
    public var mediumDisplay: String?

    public init(id: Int? = nil, apiModel: String? = nil, apiLink: String? = nil, isBoosted: Bool? = nil, title: String? = nil, altTitles: [String]? = nil, description: String? = nil, imageId: String? = nil, altImageIds: [String]? = nil, dateDisplay: String? = nil, artistDisplay: String? = nil, mediumDisplay: String? = nil) {
        self.id = id
        self.apiModel = apiModel
        self.apiLink = apiLink
        self.isBoosted = isBoosted
        self.title = title
        self.altTitles = altTitles
        self.description = description
        self.imageId = imageId
        self.altImageIds = altImageIds
        self.dateDisplay = dateDisplay
        self.artistDisplay = artistDisplay
        self.mediumDisplay = mediumDisplay
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case apiModel = "api_model"
        case apiLink = "api_link"
        case isBoosted = "is_boosted"
        case title
        case altTitles = "alt_titles"
        case description
        case imageId = "image_id"
        case altImageIds = "alt_image_ids"
        case dateDisplay = "date_display"
        case artistDisplay = "artist_display"
        case mediumDisplay = "medium_display"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(apiModel, forKey: .apiModel)
        try container.encodeIfPresent(apiLink, forKey: .apiLink)
        try container.encodeIfPresent(isBoosted, forKey: .isBoosted)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(altTitles, forKey: .altTitles)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(imageId, forKey: .imageId)
        try container.encodeIfPresent(altImageIds, forKey: .altImageIds)
        try container.encodeIfPresent(dateDisplay, forKey: .dateDisplay)
        try container.encodeIfPresent(artistDisplay, forKey: .artistDisplay)
        try container.encodeIfPresent(mediumDisplay, forKey: .mediumDisplay)
    }
}

