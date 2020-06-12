//
//  NewBandData.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/06/12.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//


//어떤 success, message, 성공 데이터를 불러올 것인지 선언한다.
import Foundation

struct NewBandData: Codable {
    let success: Bool
    let message: String
    let data: [NewBandDataClass]
    
    // MARK: - Datum
    struct NewBandDataClass: Codable {
        let bandName: String
        let bandImg: String
        
        enum CodingKeys: String, CodingKey {
            case bandName = "band_name"
            case bandImg = "band_img"
        }
    }
    
}
