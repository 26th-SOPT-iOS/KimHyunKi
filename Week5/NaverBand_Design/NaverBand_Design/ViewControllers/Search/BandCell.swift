//
//  BandCell.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/29.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class BandCell: UICollectionViewCell {
    static let identifier: String = "BandCell"
    @IBOutlet weak var BackImg: UIImageView!
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var Button: UIButton!
    /*
    func set(_ bandInformation: Band){
        Img.image = bandInformation.image
        titleLabel.text = bandInformation.title
        numberLabel.text = bandInformation.number
        nameLabel.text = bandInformation.name
        
    }
 */
    
    func setBandInfo(imageName: String, title: String, number: String, name: String) {
        Img.image = UIImage(named: imageName)
        titleLabel.text = title
        numberLabel.text = number
        nameLabel.text = name
    }
    
}
