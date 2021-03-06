//
//  APIConstants.swift
//  iOS_SecondWeek_Assignment_Login
//
//  Created by 김현기 on 2020/05/16.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation


struct APIConstants{
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
    
}
