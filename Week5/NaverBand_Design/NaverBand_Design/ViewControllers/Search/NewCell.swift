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
    
    @IBOutlet weak var NewImg: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    /*
    func set(_ newInformation: New){
        NewImg.image = newInformation.image
        Label.text = newInformation.title
    }
  */
    
    
     override func awakeFromNib() {
         super.awakeFromNib()
         
     }
     
    
    
    
    /* 서버 안쓸때 일일이 연결하는 경우
    func setNewBandInfo(imageName: String, name: String) {
        Img.image = UIImage(named: imageName)
        Label.text = name
    }
 */


}
