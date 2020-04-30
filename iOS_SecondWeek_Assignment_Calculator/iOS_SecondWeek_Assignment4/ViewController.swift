//
//  ViewController.swift
//  iOS_SecondWeek_Assignment4
//
//  Created by 김현기 on 2020/04/28.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var operatorButton: [UIButton]!
    @IBOutlet var digitButton: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    func setLayout(){
        
        digitButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height  * 0.5
        })
        operatorButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height  * 0.5
        })
    }

}

