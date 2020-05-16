//
//  Friends.swift
//  iOS_ThirdWeek_Assignment
//
//  Created by 김현기 on 2020/05/12.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation
import UIKit

struct Friends {
    var profileImg: String
    var name: String
    var statusMsg: String
    
    init(profile: String, name: String, status: String){
        //self.profileImg = UIImage(named: profile)
        self.profileImg = profile
        self.name = name
        self.statusMsg = status
        
    }
}


