//
//  SignupViewController.swift
//  iOS_4thWeek_Assignment
//
//  Created by 김현기 on 2020/05/20.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

 
    @IBAction func signup(_ sender: Any) {
        guard let inputID = idTextField.text else {return}
        guard let inputPWD = passwordTextField.text else{return}
        guard let inputNAME = nameTextField.text else{return}
        guard let inputEMAIL = emailTextField.text else{return}
        guard let inputPHONE = phoneTextField.text else{return}
        
        
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE){ networkResult in switch networkResult {
               case .success:
                //guard let success = success as? String else { return }
                //UserDefaults.standard.set(success, forKey: "success")
                   
                   self.navigationController?.popToRootViewController(animated: true)
                   
                   //탭바 컨트롤러 화면으로 넘어가는 코드
                   /*
                   guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                       "customTabbarController") as? UITabBarController else { return }
                   tabbarController.modalPresentationStyle = .fullScreen
                   self.present(tabbarController, animated: true, completion: nil)
                   */
                   
                   
                   print("회원가입 성공")
            
            
               case .requestErr(let message):
                   guard let message = message as? String else { return }
                   let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                   
                   let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                   alertViewController.addAction(action)
                   
                   self.present(alertViewController, animated: true, completion: nil)
                   
               case .pathErr: print("path")
               case .serverErr: print("serverErr")
               case .networkFail: print("networkFail") }
               }
               
           }
        
        
        
        
    }
    

