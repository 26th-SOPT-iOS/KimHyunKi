//
//  FirstViewController.swift
//  iOS_firsWeek_Seminar_Exercise
//
//  Created by 김현기 on 2020/04/18.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var sampleSwitch: UISwitch!
    
    @IBOutlet weak var sampleSlider: UISlider!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

   
    @IBAction func transferData(_ sender: Any) {
        
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"secondViewController") as? SecondViewController else {return}
        
        receiveViewController.name = nameTextField.text
        receiveViewController.email = emailTextField.text
        receiveViewController.isOnOff = sampleSwitch.isOn
        receiveViewController.frequency = sampleSlider.value
        
        self.present(receiveViewController, animated: true, completion: nil)
    }
    
}
