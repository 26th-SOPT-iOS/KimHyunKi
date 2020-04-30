//
//  ResultViewController.swift
//  iOS_firstWeek_Assignment3
//
//  Created by 김현기 on 2020/04/21.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels() 

    }
    var id: String?
    var password: String?
    
    @IBAction func logoutButton(_ sender: Any) {
    
        let presentingVC = self.presentingViewController!
        let navigationController = presentingVC is UINavigationController ? presentingVC as? UINavigationController : presentingVC.navigationController
                  
                  navigationController?.popToRootViewController(animated: false)
                  
                  
                  self.dismiss(animated: true, completion: nil)
    
    }
    private func setLabels(){
          //optional Biding
        guard let id = self.id else {return}
        guard let password = self.password else{return}

              
        idTextField.text = id
        passwordTextField.text = password
    }

}
