//
//  SignUpViewController.swift
//  iOS_firstWeek_Assignment3
//
//  Created by 김현기 on 2020/04/21.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    

    @IBAction func signupData(_ sender: Any) {
    
    guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"resultViewController") as? ResultViewController else {return}
    
    receiveViewController.id = idTextField.text
    receiveViewController.password = passwordTextField.text

    
    self.present(receiveViewController, animated: true, completion: nil)
    
    
    }
    

}
