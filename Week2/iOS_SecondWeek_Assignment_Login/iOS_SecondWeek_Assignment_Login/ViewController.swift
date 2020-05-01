//
//  ViewController.swift
//  iOS_SecondWeek_Assignment_Login
//
//  Created by 김현기 on 2020/04/28.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit
@IBDesignable

class ViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        emailTextField.addLeftPadding()
        passwordTextField.addLeftPadding()
        
        navigationController?.isNavigationBarHidden = true
    }
}

extension UIView{

    @IBInspectable
    var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

extension UITextField {
    func addLeftPadding(){
        let paddingView = UIView(frame: CGRect (x: 0, y:0, width: 18, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}



