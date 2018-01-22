//
//  MeVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/27/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }//end view did load
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userEmail.text = Auth.auth().currentUser?.email
    }

//Actions
    
    @IBAction func signUpPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you wat to logout?", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (LogoutPressed) in
            do {
                try Auth.auth().signOut()
                let AuthVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(AuthVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    


}//end controller 
