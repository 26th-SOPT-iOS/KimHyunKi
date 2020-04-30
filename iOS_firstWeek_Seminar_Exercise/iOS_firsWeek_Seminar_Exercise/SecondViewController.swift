//
//  SecondViewController.swift
//  iOS_firsWeek_Seminar_Exercise
//
//  Created by 김현기 on 2020/04/18.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var frequencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels() 
    
   
        
       
    
    }
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?
    

    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    
        

    }

      private func setLabels(){
        //optional Biding
        guard let name = self.name else {return}
        guard let email = self.email else{return}
        guard let isOnOff = self.isOnOff else {return}
        guard let frequency = self.frequency else {return}
        
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "On" : "Off"
        frequencyLabel.text = "\(frequency)"
    }

  


}


