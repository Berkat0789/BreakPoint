//
//  LoginVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/20/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
//---Outlets
    
    @IBOutlet weak var passwordField: insetTextField!
    @IBOutlet weak var emailField: insetTextField!
    
//---Variables and 

    override func viewDidLoad() {
        super.viewDidLoad()

    }

//---Actions
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func signINPressed(_ sender: Any) {
        guard let email = emailField.text, emailField.text != "" else {return}
        guard let password = passwordField.text, passwordField.text != "" else {return}
        
        AuthService.instance.RegisterUser(email: email, Password: password) { (Success, error) in
            if Success {
                AuthService.instance.LoginUser(email: email, Password: password, loginCompleted: { (Success, error) in
                    if Success {
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            } else {
                debugPrint(error as Any)
            }
        }//end register user
        
    }//end sign in pressed
    
    

}
