//
//  DetailViewController.swift
//  iOS_ThirdWeek_Seminar2
//
//  Created by 김현기 on 2020/05/10.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    var imageName: String = ""
    var date: String = ""
    var subTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView(){
        weatherImageView.image = UIImage(named: imageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
    }


}


