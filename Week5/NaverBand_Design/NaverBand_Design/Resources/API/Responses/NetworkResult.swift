//
//  NetworkResult.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/30.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    
case success(T)
case requestErr(T)
case pathErr
case serverErr
case networkFail

}


