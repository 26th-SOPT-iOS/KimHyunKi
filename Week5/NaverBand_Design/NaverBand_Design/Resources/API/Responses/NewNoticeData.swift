//
//  NewNoticeData.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/06/12.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation

struct NewNoticeData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [NewNoticeDataClass]
    
    
    // MARK: - Datum
    struct NewNoticeDataClass: Codable {
        let noticeTitle, noticeSub: String
        let noticeThumbnail: String
        
        enum CodingKeys: String, CodingKey {
            case noticeTitle = "notice_title"
            case noticeSub = "notice_sub"
            case noticeThumbnail = "notice_thumbnail"
        }
    }
}
