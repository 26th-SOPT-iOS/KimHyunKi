//
//  NewCell.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/29.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class NewCell: UICollectionViewCell {
    
    static let identifier: String = "NewCell"
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    /*
    func set(_ newInformation: New){
        Img.image = newInformation.image
        Label.text = newInformation.title
    }
  */
    
    
    func setNewBandInfo(imageName: String, name: String) {
        Img.image = UIImage(named: imageName)
        Label.text = name
    }
 


}
