//
//  NewTableCell.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/28.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class NewTableCell: UITableViewCell {
    
    //식별자 지정
    static let identifier: String = "NewTableCell"
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var fixLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setnewTableInformations(ImageName: String, title: String, subtitle: String){
        
        Img.image = UIImage(named: ImageName)
        TitleLabel.text = title
        subTitleLabel.text = subtitle
    }

}
