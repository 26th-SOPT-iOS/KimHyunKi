//
//  Band.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/29.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation

import UIKit

struct Band{
    
    // var image : UIImage?
    var image: String
    var title : String
    var number : String
    var name : String
    
    init(imageName: String, title: String, number: String, name: String){
        
        //self.image = UIImage(named: imageName)
        self.image = imageName
        self.title = title
        self.number = number
        self.name = name
    }
}
