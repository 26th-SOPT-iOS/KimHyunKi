//
//  RecommendBandData.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/06/12.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation

struct RecommendBandData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [RecommendBandDataClass]
    
    
    // MARK: - Datum
    struct RecommendBandDataClass: Codable {
        let bandName, bandNumOfMember: String
        let bandImg: String
        let userNickname: String
        
        enum CodingKeys: String, CodingKey {
            case bandName = "band_name"
            case bandNumOfMember = "band_num_of_member"
            case bandImg = "band_img"
            case userNickname = "user_nickname"
        }
    }
}
