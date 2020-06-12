//
//  PageCell.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/29.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    static let identifier: String = "PageCell"
    @IBOutlet weak var PageImg: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var Button: UIButton!
    
    /*
    func set(_ pageInformation: Page){
        PageImg.image = pageInformation.image
        TitleLabel.text = pageInformation.title
        subTitleLabel.text = pageInformation.subtitle
        
    }
    */
    
     override func awakeFromNib() {
         super.awakeFromNib()
         
     }
     
    
    /*서버 안쓸 때 일일이
    func setPageInfo(imageName: String, title: String, subtitle: String) {
        Img.image = UIImage(named: imageName)
        TitleLabel.text = title
        subTitleLabel.text = subtitle
    }
    */

}
