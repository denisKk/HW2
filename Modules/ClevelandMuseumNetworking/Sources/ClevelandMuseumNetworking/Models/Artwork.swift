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
    public var title: String?
    public var images: ArtworkImages?
    public var description: String?
    public var creationDate: String?
    public var creators: [ArtworkCreatorsInner]?
    public var technique: String?

    public init(id: Int? = nil, title: String? = nil, images: ArtworkImages? = nil, description: String? = nil, creationDate: String? = nil, creators: [ArtworkCreatorsInner]? = nil, technique: String? = nil) {
        self.id = id
        self.title = title
        self.images = images
        self.description = description
        self.creationDate = creationDate
        self.creators = creators
        self.technique = technique
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case images
        case description
        case creationDate = "creation_date"
        case creators
        case technique
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(images, forKey: .images)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(creationDate, forKey: .creationDate)
        try container.encodeIfPresent(creators, forKey: .creators)
        try container.encodeIfPresent(technique, forKey: .technique)
    }
}
