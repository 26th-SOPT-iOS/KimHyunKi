//
//  NetworkResult.swift
//  iOS_4thWeek_Assignment
//
//  Created by 김현기 on 2020/05/16.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation

enum NetworkResult<T>
{
    case success(T)
    case requestErr(T) //통신에 성공했지만 패스워드(정보)가 잘못된 경우
    case pathErr //서버 내부에러
    case serverErr
    case networkFail //통신 불가
}

