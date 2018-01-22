//
//  AuthVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/20/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       if Auth.auth().currentUser != nil {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
//---Actions
    @IBAction func loginWithEmailPRessed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
        
    }
    @IBAction func facebookSelected(_ sender: Any) {
    }
    @IBAction func googlePressed(_ sender: Any) {
    }
    
    

}
