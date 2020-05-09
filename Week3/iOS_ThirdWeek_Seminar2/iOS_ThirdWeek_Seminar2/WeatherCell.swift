//
//  WeatherCell.swift
//  iOS_ThirdWeek_Seminar2
//
//  Created by 김현기 on 2020/05/10.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    static let identifier: String = "WeatherCell"
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDateInformation(weatherImageName: String, date: String, subTitle: String){
        
        weatherImageView.image = UIImage(named: weatherImageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
        
    }

}
