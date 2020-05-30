//
//  New.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/29.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation
import UIKit

struct New {
    //서버 안쓸때
    //var image: String
    
    
    var image: UIImage?
    var title: String
    
    init(imageName: String, title: String){
        
        self.image = UIImage(named: imageName)
        
        //서버 안쓸땐
        //self.image = imageName
        
        
        self.title = title
    }
}
