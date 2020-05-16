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
    
    
    @IBAction func login(_ sender: Any) {
        guard let inputID = emailTextField.text else {return}
        guard let inputPWD = passwordTextField.text else{return}
        
    //로그인 액션
    /*
    guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"resultViewController") as? ResultViewController else {return}
           
           receiveViewController.id = idTextField.text
           receiveViewController.password = passwordTextField.text

           
           self.present(receiveViewController, animated: true, completion: nil)
        */
        
        
        
    LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in switch networkResult {
      case .success(let token):
      guard let token = token as? String else { return }
      UserDefaults.standard.set(token, forKey: "token")
      
      guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
        "customTabbarController") as? UITabBarController else { return }
      tabbarController.modalPresentationStyle = .fullScreen
      self.present(tabbarController, animated: true, completion: nil)
      case .requestErr(let message):
        guard let message = message as? String else { return }
        let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
      self.present(alertViewController, animated: true, completion: nil)
      case .pathErr: print("path")
      case .serverErr: print("serverErr")
      case .networkFail: print("networkFail") }
      }
    
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



