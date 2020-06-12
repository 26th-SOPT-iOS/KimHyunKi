//
//  RecommendPageData.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/06/12.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation

struct RecommendPageData: Codable {
    let success: Bool
    let message: String
    let data: [RecommendPageDataClass]
    
    
    // MARK: - Datum
    struct RecommendPageDataClass: Codable {
        let pageName, pageDetail: String
        let pageImg: String
        
        enum CodingKeys: String, CodingKey {
            case pageName = "page_name"
            case pageDetail = "page_detail"
            case pageImg = "page_img"
        }
    }
}
