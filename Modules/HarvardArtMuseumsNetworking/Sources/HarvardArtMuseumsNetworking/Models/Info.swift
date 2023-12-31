//
// Info.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Info: Codable, JSONEncodable, Hashable {

    public var totalrecords: Int?
    public var next: String?

    public init(totalrecords: Int? = nil, next: String? = nil) {
        self.totalrecords = totalrecords
        self.next = next
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case totalrecords
        case next
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(totalrecords, forKey: .totalrecords)
        try container.encodeIfPresent(next, forKey: .next)
    }
}

