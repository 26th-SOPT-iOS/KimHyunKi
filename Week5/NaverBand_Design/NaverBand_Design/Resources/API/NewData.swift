//
//  NewData.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/30.
//  Copyright © 2020 HyunKi Kim. All rights reserved.

import Foundation
import Alamofire

// MARK: - New
struct NewData: Codable {
    let bandID: Int
    let bandName, bandInfo: String
    let bandMemberCount, bandMemberRepre, bandImg: JSONNull?
    let createDe: String

    enum CodingKeys: String, CodingKey {
        case bandID = "BAND_ID"
        case bandName = "BAND_NAME"
        case bandInfo = "BAND_INFO"
        case bandMemberCount = "BAND_MEMBER_COUNT"
        case bandMemberRepre = "BAND_MEMBER_REPRE"
        case bandImg = "BAND_IMG"
        case createDe = "CREATE_DE"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
