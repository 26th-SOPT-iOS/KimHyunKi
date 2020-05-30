//
//  Page.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/29.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation
import UIKit

struct Page {
    var image: UIImage?
    //서버 안쓸때
    //var image: String
    var title: String
    var subtitle: String
    
    init(imageName: String, title: String, subtitle: String){
        self.image = UIImage(named: imageName)
        //서버 안쓸떄 
        //self.image = imageName
        self.title = title
        self.subtitle = subtitle
    }
}
